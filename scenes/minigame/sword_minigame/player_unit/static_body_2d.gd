extends Area2D

@onready var line: Line2D = $Line2D
@onready var coll: CollisionShape2D = $CollisionShape2D
@onready var cursor: Sprite2D = $Cursor
@onready var aniamtion_player: AnimationPlayer = $AnimationPlayer

var last_point = Vector2(0, 0)


func _process(delta: float) -> void:
	cursor.position = to_local(get_global_mouse_position())
	if Input.is_action_just_pressed("click"):
		aniamtion_player.play("attacking")
		last_point = to_local(get_global_mouse_position())
	if Input.is_action_pressed("click"):
		var new_point = to_local(get_global_mouse_position())
		line.add_point(new_point)
		var new_coll = coll.duplicate()
		var new_shape = coll.shape.duplicate()
		new_coll.shape = new_shape
		new_coll.shape.a = last_point
		new_coll.shape.b = new_point
		new_coll.add_to_group("created_collisions")
		add_child(new_coll, true)
		last_point = new_point
	if Input.is_action_just_released("click"):
		aniamtion_player.play("attacking")
		line.clear_points()
		for collision in get_tree().get_nodes_in_group("created_collisions"):
			collision.queue_free()
		last_point = to_local(get_global_mouse_position())


func _on_area_entered(area: Area2D) -> void:
	print("shape")
	GameEvents.emit_shape_broken(area)
