extends Node2D


@onready var shape_spawn_manager = $ShapeSpawnManager


func _ready() -> void:
	GameEvents.minigame_ended.connect(transition_scene)


func transition_scene():
	shape_spawn_manager.queue_free()
	for shape in get_tree().get_nodes_in_group("shape"):
		shape.queue_free()
	# code here to switch scenes