extends Node

signal scene_changed
signal target_hit
signal shape_broken


func emit_scene_changed():
	scene_changed.emit()

func emit_target_hit(value: int):
	target_hit.emit(value)

func emit_shape_broken(shape: Node2D):
	shape_broken.emit(shape)
