extends Node2D
@export var points_for: Label
@export var points_against: Label
@onready var final_score = $FinalScore
@onready var player_score = $player_hit_correct/good_hit
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready")
	GameEvents.minigame_ended.connect(display_final_score)


func display_final_score():
	print("emitted")
	final_score.text = "You score " + str(player_score.text) + " points"
	animation_player.play("play_final_score")
