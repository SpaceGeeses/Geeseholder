## Draws the unit's movement path using an autotile.
class_name UnitPath
extends TileMap

@export var grid: Resource

var _pathfinder: PathFinder
var current_path := PackedVector2Array()


## Creates a new PathFinder that uses the AStar algorithm to find a path between two cells among
## the `walkable_cells`.
func initialize(walkable_cells: Array) -> void:
	_pathfinder = PathFinder.new(grid, walkable_cells)


## Finds and draws the path between `cell_start` and `cell_end`
func draw(cell_start: Vector2, cell_end: Vector2) -> void:
	clear()
	current_path = _pathfinder.calculate_point_path(cell_start, cell_end)
	set_cells_terrain_connect(0, current_path, 0, 0)


## Stops drawing, clearing the drawn path and the `_pathfinder`.
func stop() -> void:
	_pathfinder = null
	clear()


func _ready() -> void:
	var rect_start := Vector2(0, 0)
	var rect_end := Vector2(0, 1)
	var points := []
	for x in rect_end.x - rect_start.x + 1:
		for y in rect_end.y - rect_start.y + 1:
			points.append(rect_start + Vector2(x, y))
	initialize(points)
	draw(rect_start, rect_end)
