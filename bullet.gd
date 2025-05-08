extends Node2D

@export var speed: float = 500.0

func _process(delta):
	var sprite = $Area2D/AnimatedSprite2D
	sprite.play("move")
	
	position.y -= speed * delta

	if position.y < -100:
		queue_free()
