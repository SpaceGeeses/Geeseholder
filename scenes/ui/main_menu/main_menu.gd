extends Control


func _ready() -> void:
	$MarginContainer/VBoxContainer/Button.pressed.connect(on_start_button_pressed)


func on_start_button_pressed():
	GameEvents.start_game.emit()
