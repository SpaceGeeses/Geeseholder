extends Area2D


func _ready() -> void:
	area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
	print(other_area)
	other_area.get_parent().queue_free()
