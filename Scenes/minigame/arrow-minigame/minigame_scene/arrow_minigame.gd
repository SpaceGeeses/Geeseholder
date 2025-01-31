extends Node2D

@export var target: PackedScene
@export var final_score: PackedScene
@onready var timer = $Timer
var timer_iterations = 0

func _ready() -> void:
  timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
  var target_instance = target.instantiate()
  get_parent().add_child(target_instance)
  timer_iterations += 1
  if timer_iterations == 5:
    timer.queue_free()
    var score_instance = final_score.instantiate()
    get_parent().add_child(score_instance)
