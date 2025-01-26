extends Area2D

@onready var animation_player: AnimationPlayer = $Target_resize
@export var area: ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_target_ran_location()
	animation_player.play('scale_change')
	await animation_player.animation_finished
	queue_free()
	print('ready')

func add_target_ran_location():
	var random_x = randf_range(area.position.x, area.size.x)
	var random_y = randf_range(area.position.y, area.size.y)
	position = Vector2(random_x, random_y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass
