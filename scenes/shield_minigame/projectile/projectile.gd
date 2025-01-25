extends CharacterBody2D

var ran_dir
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = position.x + 20
	position.y = position.y + 20
	set_deferred('freeze', true)
	const DIRECTIONS = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]
	ran_dir = DIRECTIONS.pick_random()
	

func _process(delta: float) -> void:
	rotate(delta * 5)
	pass

func unfeeze():
	set_deferred('freeze', false)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(ran_dir * velocity * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		collider.bounce(collision.get_normal())
		print(collider)