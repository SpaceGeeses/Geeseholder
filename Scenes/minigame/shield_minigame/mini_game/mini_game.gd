extends Node

@export var label: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.projectile_destroyed.connect(projectile_destroyed)


func projectile_destroyed():
	var projectile_total: Array = get_tree().get_nodes_in_group("Projectiles")
	print(projectile_total.size())
	if projectile_total.size() == 1:
		var label_instance = label.instantiate()
		add_child(label_instance)
