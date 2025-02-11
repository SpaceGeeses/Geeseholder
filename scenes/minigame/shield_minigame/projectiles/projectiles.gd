extends Node2D

@export var parent: Node
@export var speed_modifier: int = 200
@onready var pivot_point = $PivotPoint


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = $Timer
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	choose_random_child()


func choose_random_child():
	var children = pivot_point.get_children()

	if children.size() > 0:
		var random_index = randi() % children.size()
		var random_child: RigidBody2D = children[random_index]
		random_child.linear_velocity = Vector2(
			random_child.position.x + speed_modifier, random_child.position.y + speed_modifier
		)
		random_child.reparent(parent)
		
	else:
		return null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(delta * 3)


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
