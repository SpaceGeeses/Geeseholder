extends Node2D

@onready var shape_spawn_manager = $ShapeSpawnManager


func _ready() -> void:
	GameEvents.minigame_ended.connect(transition_scene)
	OverworldState.player_points = 0
	OverworldState.enemy_points = 0


func transition_scene():
	shape_spawn_manager.queue_free()
	await get_tree().create_timer(1).timeout
	GameEvents.emit_scene_changed()
