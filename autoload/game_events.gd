extends Node

signal scene_changed
signal target_hit


func emit_scene_changed():
	scene_changed.emit()

func emit_target_hit(value: int):
	target_hit.emit(value)
