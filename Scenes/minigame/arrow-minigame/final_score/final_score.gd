extends Node2D

@onready var animation_player: AnimationPlayer = $final_score_boom
@onready var popup_score = $Label
var popup_string

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score_label: Label = get_tree().get_nodes_in_group("score")[0]
	popup_string = "You have scored " + score_label.text + "!!"
	popup_up_location()
	animation_player.play('pop_up')
	popup_score.text = popup_string

func popup_up_location():
	var viewport = get_viewport().size
	position = viewport / 2
