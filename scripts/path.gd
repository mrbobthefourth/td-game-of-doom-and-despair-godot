extends Path2D

var waveCount =  1
@onready var enemy_scene = preload("res://scenes/path_enemy.tscn")
@onready var fenemy_scene = preload("res://scenes/fast_enemy.tscn")
@onready var tenemy_scene = preload("res://scenes/tank_enemy.tscn")
func _ready():
	await get_tree().create_timer(2).timeout
	wave(1)

func wave(wave):
	if wave == 1: # WAVE 1 -------------------------------------------------------------------------
		var enemy = enemy_scene.instantiate()
		add_child(enemy, true)
	elif wave == 2: # WAVE 2 -----------------------------------------------------------------------
		for i in range(4):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 3: # WAVE 3 -----------------------------------------------------------------------
		for i in range(6):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 4: # WAVE 4 -----------------------------------------------------------------------
		for i in range(9):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 5: # WAVE 5------------------------------------------------------------------------
		for i in range(4):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(6):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 6: # WAVE 6------------------------------------------------------------------------
		for i in range(11):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 7: # WAVE 7------------------------------------------------------------------------
		for i in range(9):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(5):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 8: # WAVE 8 -----------------------------------------------------------------------
		for i in range(16):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(0.5).timeout
	elif wave == 9: # WAVE 9 -----------------------------------------------------------------------
		for i in range(12):
			var enemy = fenemy_scene.instantiate()
			var fenemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
			add_child(fenemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 10: # WAVE 10 ----------------------------------------------------------------------
		for i in range(25):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(25):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(10):
			var enemy = tenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1.2).timeout
	elif wave == 11: # WAVE 11 ---------------------------------------------------------------------
		for i in range(30):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(15):
			var enemy = tenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1.2).timeout
	elif wave == 12: # WAVE 12 ---------------------------------------------------------------------
		for i in range(30):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1.2).timeout
			var tenemy = tenemy_scene.instantiate()
			add_child(tenemy, true)
			await get_tree().create_timer(1.0).timeout
			var fenemy = fenemy_scene.instantiate()
			add_child(fenemy, true)
			await get_tree().create_timer(1).timeout

func _process(delta: float) -> void:
	await get_tree().create_timer(2).timeout
	if get_child_count() == 0 and waveCount != 10:
		waveCount += 1
		wave(waveCount)
