extends Node2D

@onready var target_child = $Target
var stored_node: Node = null
@onready var timer = $Timer
@onready var area = $Area_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	remove_child_from_scene()
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	print("Try and hit me!")
	remove_child_from_scene()
	add_target_ran_location()
	add_child_back()
	
func add_target_ran_location():
	var random_x = randf_range(area.position.x, area.size.x)
	var random_y = randf_range(area.position.y, area.size.y)
	stored_node.position = Vector2(random_x, random_y)

func remove_child_from_scene():
	stored_node = target_child
	remove_child(target_child)

func add_child_back():
	add_child(stored_node)
