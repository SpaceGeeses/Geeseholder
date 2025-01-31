extends Area2D

@export var score: int = 0
var hit: int = 0
var isHit: bool = false

func _input_event(_viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && isHit == false:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			isHit = true
			match shape_idx:
				0:
					print("Clicked on BullsEye")
					hit += 3
				1:
					print("Clicked on Mid, so close!")
					hit += 2

				2:
					print("Clicked on Outside, watch out!")
					hit += 1
		handle_score(hit)

func handle_score(hit_points):
	GameEvents.emit_target_hit(hit_points)
