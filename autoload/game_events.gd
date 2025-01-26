extends Node

signal scene_changed


func emit_scene_changed():
	scene_changed.emit()
