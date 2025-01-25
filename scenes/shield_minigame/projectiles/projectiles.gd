extends Node2D

@export var parent: Node
@onready var pivot_point = $PivotPoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = $Timer
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	print("Time to attack!")
	choose_random_child()

func choose_random_child():
	var children = pivot_point.get_children()

	if children.size() > 0:
		var random_index = randi() % children.size()
		var random_child: CharacterBody2D = children[random_index]
		random_child.collision_layer = 2
		random_child.collision_mask = 2
		random_child.set_deferred('freeze', false)
		random_child.velocity = position
		wait(.1)
		random_child.reparent(parent)
		print("Random Child selected: ", random_child.name)

	else:
		print('No children available')
		return null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(delta * 3)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout