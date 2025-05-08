extends Node2D

@export var speed: float = 300.0
@export var bullet_scene: PackedScene

var direction = Vector2.ZERO

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
		$AnimatedSprite2D.play("move")
	else:
		$AnimatedSprite2D.play("wait")
	# スペースキーで弾を発射
	if Input.is_action_just_pressed("ui_accept"):  # デフォルトで Space に割り当てられている
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)

	bullet.position = position  # position はプレイヤーのローカル座標
	bullet.global_position = global_position  # これでグローバル座標に調整
