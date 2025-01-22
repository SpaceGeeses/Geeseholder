extends Camera2D

var target_position = Vector2.ZERO
@export var lag_behind = 20.0  # Smoothness factor to control camera follow speed


# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


func _process(delta):
	acquire_target()
	# Smoothly interpolate the camera position towards the player
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * lag_behind))


func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[1] as Node2D
		target_position = player.global_position
