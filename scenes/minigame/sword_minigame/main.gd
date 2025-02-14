extends Node2D

@onready var shape_spawn_manager = $ShapeSpawnManager


func _ready() -> void:
	GameEvents.minigame_ended.connect(transition_scene)
	OverworldState.player_points = 0
	OverworldState.enemy_points = 0


func transition_scene():
	shape_spawn_manager.queue_free()
	for shape in get_tree().get_nodes_in_group("shape"):
		shape.queue_free()

	await get_tree().create_timer(1.5).timeout
	GameEvents.emit_scene_changed()
