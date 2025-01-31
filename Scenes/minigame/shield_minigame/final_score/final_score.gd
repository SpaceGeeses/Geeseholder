extends Node2D

@onready var animation_player: AnimationPlayer = $final_score_boom
@onready var popup_score = $Label
var popup_string
var player_score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.score_increase.connect(uptick_score)
	popup_string = "You have scored " + str(player_score) + "!!"
	popup_up_location()
	animation_player.play('pop_up')
	popup_score.text = popup_string

func popup_up_location():
	var viewport = get_viewport().size
	position = viewport / 2

func uptick_score(type: String):
	if type == 'player':
		player_score += 1
