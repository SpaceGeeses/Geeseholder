extends Node

signal scene_changed
signal score_increase


func emit_scene_changed():
	scene_changed.emit()

func emit_score_increase(type: String):
	score_increase.emit(type)