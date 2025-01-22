extends CharacterBody2D

var p_height: int
@export var max_speed = 200
@export var acceleration_smoothing = 5


func _ready() -> void:
    $CollisionArea2D.body_entered.connect(on_body_entered)
    p_height = $ColorRect.get_size().y


func _process(delta: float) -> void:
    var movement_vector = get_movement_vector()
    var direction = movement_vector.normalized()
    var target_velocity = direction * max_speed

    velocity = velocity.lerp(target_velocity, 1 - exp(-delta * acceleration_smoothing))
    move_and_slide()


func get_movement_vector():
    
    var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

    return Vector2(0, y_movement)


func on_body_entered(other_body: Node2D):
    print("hello")