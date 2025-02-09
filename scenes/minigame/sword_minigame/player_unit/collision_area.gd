extends Area2D

@onready var line: Line2D = $Line2D
@onready var coll: CollisionShape2D = $CollisionShape2D
@onready var cursor: Sprite2D = $Cursor
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var slice_length: float = 20

var last_point = Vector2(0, 0)


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _process(_delta: float) -> void:
	cursor.position = cursor_position()
	if Input.is_action_just_pressed("click"):
		start_drawing()
	if Input.is_action_pressed("click"):
		continue_drawing()
	if (
		Input.is_action_just_released("click")
		|| get_tree().get_nodes_in_group("created_collisions").size() > slice_length
	):
		finish_drawing()


func _on_area_entered(area: Area2D) -> void:
	GameEvents.emit_shape_broken(area)


func start_drawing() -> void:
	animation_player.play("attacking")
	last_point = cursor_position()


func continue_drawing() -> void:
	var new_point = cursor_position()
	line.add_point(new_point)
	var new_coll = coll.duplicate()
	var new_shape = coll.shape.duplicate()
	new_coll.shape = new_shape
	new_coll.shape.a = last_point
	new_coll.shape.b = new_point
	new_coll.add_to_group("created_collisions")
	add_child(new_coll, true)
	last_point = new_point


func finish_drawing() -> void:
	animation_player.play("idle")
	line.clear_points()
	for collision in get_tree().get_nodes_in_group("created_collisions"):
		collision.queue_free()
	last_point = cursor_position()


func cursor_position() -> Vector2:
	return to_local(get_global_mouse_position())
