extends Node2D

@onready var timer: Timer = $Timer
@onready var chunksey = $chunk_grouping
var times_to_run = 4
var times_ran = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.connect("timeout", delete_health_chunks)
	GameEvents.score_increase.connect(total_health_lost)


func delete_health_chunks():
	GameEvents.delete_health.emit(choose_child())
	times_ran += 1
	if times_ran >= times_to_run:
		timer.stop()

func choose_child():
	var children = chunksey.get_children()
	return children.size() - 1

func total_health_lost(type, amount):
	if type == 'enemy':
		times_to_run += amount