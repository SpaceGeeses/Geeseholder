extends Node

@onready var player_score_label: Label = $PlayerScore
@onready var enemy_score_label: Label = $EnemyScore
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var final_score: Label = $FinalScore

var enemy_score = 0
var player_score = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.score_increase.connect(uptick_score)


func uptick_score(type: String):
	if type == "enemy":
		enemy_score += 1
		enemy_score_label.text = str(enemy_score)
	elif type == "player":
		player_score += 1
		player_score_label.text = str(player_score)
	check_game_ended()


func check_game_ended():
	var projectile_total: Array = get_tree().get_nodes_in_group("Projectiles")
	if projectile_total.size() == 1:
		final_score.text = "You score " + str(player_score) + " points"
		animation_player.play("pop_up_final")
