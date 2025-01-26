extends Node2D

@export var target: PackedScene
@onready var timer = $Timer


func _ready() -> void:
    timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
  print(target)
  var target_instance = target.instantiate()
  get_parent().add_child(target_instance)
