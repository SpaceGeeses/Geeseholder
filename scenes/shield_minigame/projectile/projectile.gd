extends RigidBody2D

var ran_dir

# Called when the node enters the scene tree for the first time.
# set_deferred("freeze", true)


func _physics_process(delta: float) -> void:
<<<<<<< HEAD
	var collision = move_and_collide(ran_dir * velocity * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		collider.bounce(collision.get_normal())
		print(collider)
=======
	pass
# set_deferred("freeze", false)
>>>>>>> 5c5aed1125c51482b96855229db82f4c96730a60
