extends Label

@onready var animation_player: AnimationPlayer = $final_score_boom


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("pop_up")
