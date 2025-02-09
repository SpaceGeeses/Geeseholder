extends Node2D

@export var points_for: Label
@export var points_against: Label
@onready var final_score = $FinalScore
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.final_score_player.connect(display_final_score)


func display_final_score(player_points: int):
	final_score.text = "You score " + str(player_points) + " points"
	animation_player.play("play_final_score")