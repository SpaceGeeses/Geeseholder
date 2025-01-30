extends Node

signal scene_changed
signal shape_broken


func emit_scene_changed():
	scene_changed.emit()


func emit_shape_broken(shape: Node2D):
	shape_broken.emit(shape)
