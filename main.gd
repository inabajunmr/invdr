extends Node2D


@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemy()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_enemy():
	# enemy_sceneにPackedSceneが割り当てられているか確認します。
	if enemy_scene != null:
		# **敵シーンをインスタンス化します。**
		# これにより、enemy.tscnファイルの内容から新しい敵ノードが作成されます。
		var enemy_instance = enemy_scene.instantiate()

		# 敵の初期位置を設定します。
		# ここでは例として画面上部の中央付近に配置しています。
		# get_viewport_rect().size でビューポート（画面）のサイズを取得できます。
		var screen_size = get_viewport_rect().size
		enemy_instance.position = Vector2(screen_size.x / 2, 100) # 画面中央X座標、Y座標100に配置

		# **Mainシーンの子として、作成した敵ノードを追加します。**
		# これにより、敵がゲーム画面に表示され、_processなどのコールバックが有効になります。
		add_child(enemy_instance)

		print("Enemy spawned at: ", enemy_instance.position) # デバッグ用

	else:
		print("Error: Enemy scene is not assigned in the inspector for Main script.")
