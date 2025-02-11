extends Node

@export var transition_manager: PackedScene


func _ready() -> void:
	add_child(transition_manager.instantiate())
	GameEvents.score_increase.connect(check_game_ended)


func check_game_ended(_type: String, _amount: int):
	var projectile_total: Array = get_tree().get_nodes_in_group("Projectiles")
	if projectile_total.size() == 1:
		GameEvents.minigame_ended.emit()
