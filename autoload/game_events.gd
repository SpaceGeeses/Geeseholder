extends Node

signal scene_changed
signal score_increase
signal target_hit
signal shape_broken


func emit_scene_changed():
	scene_changed.emit()

func emit_score_increase(type: String):
	score_increase.emit(type)
	
func emit_target_hit(value: int):
	target_hit.emit(value)

func emit_shape_broken(shape: Node2D):
	shape_broken.emit(shape)
