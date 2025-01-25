extends Node

@export var transition_scene: PackedScene
@export var camera: Camera2D
var tween: Tween

var target_zoom: Vector2 = Vector2(2, 2.0)
var zoom_duration: float = 0.5


func _ready():
	GameEvents.scene_changed.connect(change_scene)


func change_scene():
	var instance = transition_scene.instantiate()
	if camera:
		tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", target_zoom, zoom_duration)
		await tween.finished
	await get_tree().create_timer(0.5).timeout
	add_child(instance)
