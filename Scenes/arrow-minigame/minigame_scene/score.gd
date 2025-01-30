extends Label

var points: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.target_hit.connect(score_increase)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func score_increase(score: int):
	points += score
	self.text = str(points)
