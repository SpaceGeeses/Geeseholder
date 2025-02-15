extends Node2D
 
var player_score = 0
@onready var label = $good_hit
@export var color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.shape_broken.connect(uptick_score_on_break)

	
func uptick_score_on_break(area: Area2D):
	var type = area.get_groups()[0]
	if type == 'Bone':
		player_score += 1
		OverworldState.player_points += 1
		OverworldState.player_score += 1
	elif type == 'Stick':
		player_score += 1
		OverworldState.player_points += 1
		OverworldState.player_score += 1
	label.text = str(player_score)
