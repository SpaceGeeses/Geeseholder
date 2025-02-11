extends Node

@export var broken_bone: PackedScene
@export var broken_rock: PackedScene
@export var broken_stick: PackedScene


func _ready() -> void:
	GameEvents.shape_broken.connect(on_shape_broken)


func on_shape_broken(area: Area2D):
	var group = area.get_groups()[0]
	var scene_instance: Node2D = instantiate_shape_type(group)
	scene_instance.position = area.get_parent().position
	scene_instance.rotation = area.get_parent().rotation
	area.get_parent().queue_free()
	add_child(scene_instance)


func instantiate_shape_type(group: String) -> Node2D:
	match group:
		"Bone":
			return broken_bone.instantiate()
		"Rock":
			return broken_rock.instantiate()
		"Stick":
			return broken_stick.instantiate()
		_:
			return broken_bone.instantiate()
