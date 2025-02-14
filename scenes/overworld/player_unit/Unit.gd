## Represents a unit on the game board.
## The board manages its position inside the game grid.
## The unit itself holds stats and a visual representation that moves smoothly in the game world.
@tool
class_name Unit
extends Path2D

## Emitted when the unit reached the end of a path along which it was walking.
signal walk_finished

@export var grid: Grid
@export var move_range := 6
@export var move_speed := 600.0
@export var skin: Texture:
	set(value):
		skin = value
		if not _sprite:
			await ready
		_sprite.texture = value
@export var skin_offset := Vector2.ZERO:
	set(value):
		skin_offset = value
		if not _sprite:
			await ready
		_sprite.position = value

@onready var animation_player = $AnimationPlayer

## Coordinates of the current cell the cursor moved to.
var cell := Vector2.ZERO:
	set(value):
		cell = grid.grid_clamp(value)
## Toggles the "selected" animation on the unit.
var is_selected := true:
	set(value):
		is_selected = value
		if is_selected:
			_anim_player.play("selected")
		else:
			_anim_player.play("idle")

var _is_walking := false:
	set(value):
		_is_walking = value
		set_process(_is_walking)

@onready var _sprite: Sprite2D = $PathFollow2D/CharacterBody2D/Sprite
@onready var _anim_player: AnimationPlayer = $AnimationPlayer
@onready var _path_follow: PathFollow2D = $PathFollow2D


func _ready() -> void:
	$PathFollow2D/CharacterBody2D.connect("enemy_contact", enemy_contact)
	animation_player.play("idle")
	set_process(false)
	_path_follow.rotates = false

	cell = OverworldState.player_coordinates
	position = grid.calculate_map_position(cell)

	if not Engine.is_editor_hint():
		curve = Curve2D.new()


func _process(delta: float) -> void:
	_path_follow.progress += move_speed * delta

	if _path_follow.progress_ratio >= 1.0:
		_is_walking = false
		# Setting this value to 0.0 causes a Zero Length Interval error
		_path_follow.progress = 0.00001
		position = grid.calculate_map_position(cell)
		curve.clear_points()
		emit_signal("walk_finished")

		animation_player.stop(true)
		animation_player.play("idle")


func walk_along(path: PackedVector2Array) -> void:
	if path.is_empty():
		return

	curve.add_point(Vector2.ZERO)
	for point in path:
		curve.add_point(grid.calculate_map_position(point) - position)
	cell = path[-1]
	_is_walking = true
	is_selected = false
	animation_player.play("walking")


func enemy_contact(enemy: Area2D):
	_is_walking = false
	animation_player.play("swing")
	enemy.get_parent().queue_free()
	OverworldState.remove_enemy_spawn(cell)
	OverworldState.set_player_coordinates(cell)
	GameEvents.emit_scene_changed()
