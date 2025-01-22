extends Node2D

var p_height: int
const PLAYER_SPEED: int = 5000

@onready var area = $Area2D

var velocity: Vector2 = Vector2()

func _ready() -> void:
	p_height = $ColorRect.get_size().y

	area.monitoring = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ui_up'):
		velocity.y = -PLAYER_SPEED * delta
	elif Input.is_action_just_pressed('ui_down'):
		velocity.y = PLAYER_SPEED * delta
	else:
		velocity.y = 0

	var new_position = position + velocity
	position = new_position

	if is_colliding():
		velocity.y = 0
		print("Collision detected, movement stopped")


func is_colliding() -> bool:
	var overlapping_bodies = area.get_overlapping_bodies()
	return overlapping_bodies.size() > 0


func on_body_entered(other_body: Node2D):
	print('hello')