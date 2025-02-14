extends Node

@export var shape: PackedScene
@export var shape_bounds: ColorRect
@export var spawn_time: float
@onready var timer: Timer = $Timer


func _ready():
	timer.wait_time = OverworldState.calculate_frequeuncy(spawn_time, 0.1)
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	var shape_instance: Node2D = shape.instantiate()
	var position = add_target_ran_location()
	shape_instance.position = position
	shape_instance.scale = Vector2.ZERO
	get_parent().add_child(shape_instance)


func add_target_ran_location() -> Vector2:
	var random_x = randf_range(shape_bounds.position.x, shape_bounds.size.x)
	var random_y = randf_range(shape_bounds.position.y, shape_bounds.size.y)
	return Vector2(random_x, random_y)
