extends Node2D

@export var enemy_scene: PackedScene
const COLUMNS = 28
const ROWS = 3
const H_SPACING = 120
const V_SPACING = 120
const START_POS = Vector2(100, 100)  # 配置の開始位置

func _ready() -> void:
	for i in range(COLUMNS * ROWS):  # 0〜15
		spawn_enemy(i)

func spawn_enemy(index: int) -> void:
	if enemy_scene != null:
		var enemy_instance = enemy_scene.instantiate()

		var col = index % COLUMNS
		var row = index / COLUMNS

		enemy_instance.position = START_POS + Vector2(col * H_SPACING, row * V_SPACING)
		add_child(enemy_instance)
	else:
		print("Error: Enemy scene is not assigned in the inspector for Main script.")
