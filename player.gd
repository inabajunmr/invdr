extends Node2D

@export var speed: float = 500.0
@export var bullet_scene: PackedScene

var direction = Vector2.ZERO

func _ready():
	var screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 1.5)

func _process(delta):
	direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		position += direction * speed * delta
		$Area2D/AnimatedSprite2D.play("move")
	else:
		$Area2D/AnimatedSprite2D.play("wait")
	if Input.is_action_just_pressed("ui_accept"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)

	bullet.position = position
	bullet.global_position = global_position
