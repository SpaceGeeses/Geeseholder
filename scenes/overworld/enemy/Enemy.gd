@tool
extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var grid: Grid

var cell := Vector2.ZERO:
	set(value):
		cell = grid.grid_clamp(value)


func _ready() -> void:
	animation_player.play("idle")
	cell = grid.calculate_grid_coordinates(position)
	position = grid.calculate_map_position(cell)
