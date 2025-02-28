extends Node2D

@export var target_position: Vector2 = Vector2(100, 50)
@export var speed: float = 50.0

var original_position: Vector2
var direction: int = 1

func _ready():
	original_position = position  # Save the original position

func _process(delta):
	var target = original_position if direction == -1 else target_position
	position = position.move_toward(target, speed * delta)
	
	if position == target:
		direction *= -1
