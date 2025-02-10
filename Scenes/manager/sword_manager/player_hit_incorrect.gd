extends Node2D
 
var enemy_score = 0
@onready var label = $bad_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.shape_broken.connect(uptick_score_on_break)
	GameEvents.minigame_ended.connect(return_final_score)


func uptick_score_on_break(area: Area2D):
	var type = area.get_groups()[0]
	if type == 'Rock':
		enemy_score += 1
	label.text = str(enemy_score)

func return_final_score():
	GameEvents.final_score_enemy.emit(enemy_score)