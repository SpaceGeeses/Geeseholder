extends Node2D

var start_point = Vector2()
var end_point = Vector2()
var is_drawing = false


func _ready():
	# You can set up anything needed for the node here
	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Start drawing when the mouse is pressed
				start_point = event.position
				is_drawing = true
			else:
				# Stop drawing when the mouse is released
				end_point = event.position
				is_drawing = false
				check_collisions(start_point, end_point)


func _draw():
	if is_drawing:
		print("draw line")
		# Draw the line while the mouse is held down
		draw_line(start_point, get_local_mouse_position(), Color(1, 0, 0), 2)
	else:
		# Draw the line after the mouse is released
		draw_line(start_point, end_point, Color(0, 1, 0), 2)


func check_collisions(start: Vector2, end: Vector2):
	pass
	# var space_state = get_world_2d().direct_space_state
	# var ray = space_state.intersect_ray(start, end, [self], 1)
	# if ray:
	# 	# Collision detected
	# 	print("Collision detected at: ", ray.position)
	# else:
	# 	# No collision
	# 	print("No collision detected.")
