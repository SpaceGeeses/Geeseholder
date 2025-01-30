extends Node

@export var broken_bone: PackedScene
@export var broken_rock: PackedScene
@export var broken_stick: PackedScene


func _ready() -> void:
	GameEvents.shape_broken.connect(on_shape_broken)


func on_shape_broken(area: Area2D):
	var group = area.get_groups()[0]
	var scene_instance: Node2D
	match group:
		"Bone":
			scene_instance = broken_bone.instantiate()
		"Rock":
			scene_instance = broken_rock.instantiate()
		"Stick":
			scene_instance = broken_stick.instantiate()
	scene_instance.position = area.get_parent().position
	scene_instance.rotation = area.get_parent().rotation
	area.get_parent().queue_free()
	add_child(scene_instance)
