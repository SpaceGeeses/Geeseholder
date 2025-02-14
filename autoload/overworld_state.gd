extends Node

var player_coordinates: Vector2 = Vector2(0, 0)
var enemy_coordinates: Array[Vector2]
var player_health: int = 16


func set_player_coordinates(coordinates: Vector2):
	player_coordinates = coordinates
