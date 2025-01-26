extends Area2D

@export var score: int = 0
var hit: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# self.connect('input_event', _on_input_event)
	pass


func _input_event(_viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			match shape_idx:
				0:
					print("Clicked on BullsEye")
					hit += 1
				1:
					print("Clicked on Mid, so close!")
					hit += 1
				2:
					print("Clicked on Outside, watch out!")
					hit += 1
		print(hit)
		handle_score(hit)

func handle_score(hit_points):
	score += hit_points
