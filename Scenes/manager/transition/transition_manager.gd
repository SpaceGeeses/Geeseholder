extends Node

@export var transition_scene: PackedScene
@export var camera: Camera2D

var minigame_paths = [
	"res://scenes/minigame/sword_minigame/main.tscn",
	"res://scenes/minigame/shield_minigame/Main.tscn",
	"res://scenes/minigame/arrow_minigame/Main.tscn"
]
var board_path = "res://scenes/overworld/Board.tscn"

var tween: Tween

var target_zoom: Vector2 = Vector2(2, 2.0)
var zoom_duration: float = 0.5


func _ready():
	GameEvents.scene_changed.connect(play_scene_animation)
	GameEvents.scene_animation_finished.connect(on_scene_animation_finish)


func play_scene_animation():
	var instance = transition_scene.instantiate()
	if camera:
		tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", target_zoom, zoom_duration)
		await tween.finished
	await get_tree().create_timer(0.5).timeout
	add_child(instance)


func on_scene_animation_finish():
	if get_parent().name == "Board":
		get_tree().change_scene_to_file(minigame_paths.pick_random())
	else:
		get_tree().change_scene_to_file(board_path)
