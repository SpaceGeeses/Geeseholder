extends Node

signal scene_changed
signal scene_animation_finished

signal score_increase
signal target_hit
signal shape_broken
signal minigame_ended
signal delete_health(desiredIndex: int)


func emit_scene_changed():
	scene_changed.emit()


func emit_score_increase(type: String, amount: int = 1):
	score_increase.emit(type, amount)


func emit_target_hit(value: int):
	target_hit.emit(value)


func emit_shape_broken(shape: Node2D):
	shape_broken.emit(shape)
