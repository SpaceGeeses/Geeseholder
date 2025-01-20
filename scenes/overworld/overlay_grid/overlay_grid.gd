# GridDisplay.gd
extends Node2D

# Reference to the GridResource
@export var grid_resource : Resource

# Called every frame when the grid needs to be redrawn
func _draw():
	# Access grid_size and cell_size from the grid resource
	if grid_resource:
		var grid_size = grid_resource.size
		var cell_size = grid_resource.cell_size
		
		# Now you can use these values to draw the grid
		var grid_offset = Vector2(0, 0)  # For example, an offset for the grid on screen

		# Draw the grid lines
		for i in range(grid_size.x + 1):  # Horizontal lines
			var start_pos = grid_offset + Vector2(i * cell_size.x, 0)
			var end_pos = start_pos + Vector2(0, cell_size.y * grid_size.y)
			draw_line(start_pos, end_pos, Color(1, 1, 1), 1)
		
		for j in range(grid_size.y + 1):  # Vertical lines
			var start_pos = grid_offset + Vector2(0, j * cell_size.y)
			var end_pos = start_pos + Vector2(cell_size.x * grid_size.x, 0)
			draw_line(start_pos, end_pos, Color(1, 1, 1), 1)


		for i in range(grid_size.x):
			for j in range(grid_size.y):
				var cell_position = grid_offset + Vector2(i * cell_size.x, j * cell_size.y)
				draw_rect(Rect2(cell_position, cell_size), Color(0, 0, 0), false, 1)
