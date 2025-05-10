extends Node2D

@onready var collision_with_enemy_sound = $CollisionWithEnemy

func play_collision_with_enemy_sound():
	collision_with_enemy_sound.play()
