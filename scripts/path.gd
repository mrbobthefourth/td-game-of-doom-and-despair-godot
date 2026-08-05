extends Path2D

var waveCount =  1
@onready var enemy_scene = preload("res://scenes/path_enemy.tscn")
@onready var fenemy_scene = preload("res://scenes/fast_enemy.tscn")
@onready var tenemy_scene = preload("res://scenes/tank_enemy.tscn")
func _ready():
	wave(1)

func wave(wave):
	if wave == 1: # WAVE 1
		var enemy = enemy_scene.instantiate()
		add_child(enemy, true)
	elif wave == 2: # WAVE 2
		for i in range(4):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 3: # WAVE 3
		for i in range(3):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(6):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 4: # WAVE 4
		for i in range(12):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 5: # WAVE 5
		for i in range(7):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(3):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 6: # WAVE 6
		for i in range(8):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 7: # WAVE 7
		for i in range(10):
			var enemy = fenemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(5):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
	elif wave == 8: # WAVE 8
		for i in range(3):
			pass

func _process(delta: float) -> void:
	if get_child_count() == 0:
		waveCount += 1
		wave(waveCount)
