extends ColorRect

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var animation_states: Array = ["column_horizontal", "column_vertical", "shards"]


func _ready() -> void:
	var animation = animation_states.pick_random()
	print(animation)
	animation_player.play(animation)
