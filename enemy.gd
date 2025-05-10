extends Node2D

@export var speed: float = 200.0
var direction = 1
var vertical_offset = 50
var is_hit = false

func _ready() -> void:
	var random_number = randi_range(1, 4)	
	$Area2D/AnimatedSprite2D.play("enemy" + str(random_number))

func _process(delta: float) -> void:
	
	var screen_size = get_viewport_rect().size
	var movement = speed * delta * direction
	position.x += movement

	if position.x <= 30 or position.x >= screen_size.x - 30:
		position.y += vertical_offset  # Move down
		direction *= -1
