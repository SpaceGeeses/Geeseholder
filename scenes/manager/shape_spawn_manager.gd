extends Node

@export var shape: PackedScene
@onready var timer: Timer = $Timer
@onready var shape_bounds: ColorRect = $ShapeBounds


func _ready():
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	var shape_instance: Node2D = shape.instantiate()
	var position = add_target_ran_location()
	shape_instance.position = position
	get_parent().add_child(shape_instance)


func add_target_ran_location() -> Vector2:
	var random_x = randf_range(shape_bounds.position.x, shape_bounds.size.x)
	var random_y = randf_range(shape_bounds.position.y, shape_bounds.size.y)
	return Vector2(random_x, random_y)
