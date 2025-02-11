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
	GameEvents.minigame_ended.connect(show_final_score)


func uptick_score(type: String, amount: int):
	if type == "enemy":
		enemy_score += amount
		enemy_score_label.text = str(enemy_score)
	elif type == "player":
		player_score += amount
		player_score_label.text = str(player_score)


func show_final_score():
	final_score.text = "You score " + str(player_score) + " points"
	animation_player.play("pop_up_final")
	await get_tree().create_timer(1.5).timeout
	GameEvents.emit_scene_changed()
