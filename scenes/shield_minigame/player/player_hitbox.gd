extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
	GameEvents.emit_score_increase("player")
	print(other_area)
	other_area.get_parent().queue_free()