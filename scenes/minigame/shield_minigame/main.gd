extends Node


func _ready() -> void:
	GameEvents.score_increase.connect(check_game_ended)
	OverworldState.player_points = 0
	OverworldState.enemy_points = 0


func check_game_ended(_type: String, _amount: int):
	var projectile_total: Array = get_tree().get_nodes_in_group("Projectiles")
	if projectile_total.size() == 1:
		GameEvents.minigame_ended.emit()
