extends Area2D

@onready var animation_player: AnimationPlayer = $Target_resize

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play('scale_change')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
