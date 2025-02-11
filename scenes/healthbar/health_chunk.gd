extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var chunks = get_tree().get_nodes_in_group('health_chunk')
@onready var index = chunks.find(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.delete_health.connect(health_delete)
	
	  
func health_delete(desiredIndex):
	if index == desiredIndex:
		animation_player.play("health_burst")
		await get_tree().create_timer(1.0).timeout
		queue_free()