extends Node2D

@export var stick: PackedScene
@export var rock: PackedScene
@export var bone: PackedScene

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var selectable_shapes: Array[PackedScene] = [stick, rock, bone]


func _ready() -> void:
	rotation = randf_range(0, 2 * PI)
	var selected_shape = selectable_shapes.pick_random().instantiate()
	add_child(selected_shape)
	animation_player.play("pop in")
	selected_shape.visible = true
