extends Label

var points: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.target_hit.connect(score_increase)


func score_increase(score: int):
	points += score
	self.text = str(points)
