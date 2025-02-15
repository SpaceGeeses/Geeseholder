extends Node

@export var min_spawn: int
@export var max_spawn: int
@export var enemy_count: int

var player_coordinates: Vector2 = Vector2(0, 0)
var enemy_coordinates: Array
var player_health: int = 16
var player_points: int = 0
var enemy_points: int = 0
var difficulty: int = 4000
var player_score: int = 0
var current_scene = "start"


func _ready() -> void:
	enemy_coordinates = create_enemy_spawns()


func set_player_coordinates(coordinates: Vector2):
	player_coordinates = coordinates


func create_enemy_spawns() -> Array:
	var result: Array = []
	for i in range(enemy_count):
		var x = randi_range(min_spawn, max_spawn)
		var y = randi_range(min_spawn, max_spawn)
		result.append(Vector2(x, y))

	return result


func remove_enemy_spawn(cell: Vector2):
	var enemy_spawn_index = enemy_coordinates.find(cell)
	if enemy_spawn_index != -1:
		enemy_coordinates.remove_at(enemy_spawn_index)


func calculate_frequeuncy(start_point: float, scaling: float = 0.5):
	return start_point * pow(1.0 / OverworldState.difficulty, scaling)


func reset():
	current_scene = "start"
	player_coordinates = Vector2(0, 0)
	enemy_coordinates = create_enemy_spawns()
	player_health = 16
	player_points = 0
	enemy_points = 0
	player_score = 0
