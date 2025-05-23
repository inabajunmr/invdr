extends Node2D

@export var speed: float = 500.0


func _process(delta):
	var sprite = $Area2D/AnimatedSprite2D
	sprite.play("move")
	
	position.y -= speed * delta

	if position.y < -100:
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("enemy"):
		SFX.play_collision_with_enemy_sound()
		queue_free()
		area.get_parent().queue_free()
