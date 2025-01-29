extends Node2D
 
var enemy_score = 0
var player_score = 0
@onready var label = $Label
@export var color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.score_increase.connect(uptick_score)
	label.set("theme_override_colors/font_color", color)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func uptick_score(type: String):
	if type == 'enemy':
		enemy_score += 1
	elif type == 'player':
		player_score += 1
	if get_parent() is Area2D:
		label.text = str(enemy_score)
	elif get_parent() is Node2D:
		label.text = str(player_score)
