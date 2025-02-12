extends Area2D

signal enemy_contact


func _ready():
	area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
	area_entered.connect(on_area_entered)
	emit_signal("enemy_contact", other_area)
