extends Node2D

@onready var broken_l: RigidBody2D = $Broken
@onready var broken_r: RigidBody2D = $Broken2


func _ready() -> void:
	broken_l.angular_velocity = randf_range(0, -5)
	broken_r.angular_velocity = randf_range(0, 5)
	broken_l.linear_velocity = Vector2(randf_range(0, -50), 0)
	broken_r.linear_velocity = Vector2(randf_range(0, 50), 0)
