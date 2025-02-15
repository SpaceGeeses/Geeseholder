extends Control

@onready var total_score = $"MarginContainer/VBoxContainer/Total Score"


func _ready() -> void:
	var total_points = str(OverworldState.player_points)
	total_score.text = "Total Score: " + total_points
	$MarginContainer/VBoxContainer/Quit.pressed.connect(on_quit_pressed)
	$MarginContainer/VBoxContainer/Restart.pressed.connect(on_restart_pressed)


func on_quit_pressed():
	get_tree().quit()


func on_restart_pressed():
	OverworldState.reset()
	GameEvents.start_game.emit()
