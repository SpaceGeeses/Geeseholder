extends Node2D

@onready var timer: Timer = $Timer
@onready var chunksey = $chunk_grouping
@onready var children = chunksey.get_children()
@onready var times_to_run = OverworldState.enemy_points
@onready var times_ran = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.connect("timeout", delete_health_chunks)
	var current_health = OverworldState.player_health
	for i in range(children.size()):
		var child = children[i]
		if (i >= current_health):
			child.queue_free()


func delete_health_chunks():
		if times_ran >= times_to_run:
			timer.stop()
			return
		GameEvents.delete_health.emit(choose_child())
		times_ran += 1
		OverworldState.player_health -= 1
	

func choose_child():
	return get_tree().get_node_count_in_group("health_chunk") - 1
