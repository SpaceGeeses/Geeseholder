extends Node2D

@onready var minigame_time: Timer = $Timer
@onready var label: Label = $Label


func _ready() -> void:
	minigame_time.connect("timeout", game_completed)


func _process(delta: float) -> void:
	label.text = str(floor(minigame_time.time_left))


func game_completed():
	GameEvents.minigame_ended.emit()
