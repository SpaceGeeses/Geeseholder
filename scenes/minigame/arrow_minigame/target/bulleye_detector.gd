extends Sprite2D

var despawn_timer = 5

var score: int = 0
var hit: int = 0
var isHit: bool = false
var bullseye_factor = 0.2
var middle_factor = 0.5
var outer_factor = 0.8

@onready var click_area: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $Target_resize


func _ready() -> void:
	click_area.connect("input_event", on_target_clicked)
	var despawn_time = OverworldState.calculate_frequeuncy(despawn_timer)
	animation_player.play("spawn")
	await animation_player.animation_finished
	await get_tree().create_timer(despawn_time).timeout
	animation_player.play("despawn")
	await animation_player.animation_finished
	if isHit == false:
		GameEvents.emit_score_increase("enemy")
	queue_free()


func on_target_clicked(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click") && !isHit:
		isHit = true
		var mouse_pos = get_global_mouse_position()
		var target_center = global_position
		var target_radius = min(texture.get_width(), texture.get_height()) * scale.x * 0.5
		var bullseye_radius = target_radius * bullseye_factor
		var middle_radius = target_radius * middle_factor
		var outer_radius = target_radius * outer_factor
		var distance = target_center.distance_to(mouse_pos)

		if distance <= bullseye_radius:
			score = 3
		elif distance <= middle_radius:
			score = 2
		elif distance <= outer_radius:
			score = 1
		handle_score(score)


func handle_score(hit_points):
	GameEvents.emit_score_increase("player", hit_points)
