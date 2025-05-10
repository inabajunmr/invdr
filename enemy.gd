extends Node2D

@export var speed: float = 100.0

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position.y += speed * delta
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Bullet":
		print("Bullet hit enemy!")
		queue_free()
		body.queue_free()
