extends CanvasLayer

@onready var total_score = $"Restart/MarginContainer/VBoxContainer/Total Score"


func _ready() -> void:
	GameEvents.game_ended.connect(finish_game)
	$Restart/MarginContainer/VBoxContainer/Quit.pressed.connect(on_quit_pressed)
	$Restart/MarginContainer/VBoxContainer/Restart.pressed.connect(on_restart_pressed)


func on_quit_pressed():
	get_tree().quit()


func on_restart_pressed():
	OverworldState.reset()
	visible = false
	GameEvents.start_game.emit()

func finish_game():
	visible = true
	var total_points = str(OverworldState.player_points)
	total_score.text = "Total Score: " + total_points
