extends Path2D

var waveCount =  1
@onready var enemy_scene = preload("res://scenes/path_enemy.tscn")
@onready var fenemy_scene = preload("res://scenes/fast_enemy.tscn")

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
		for i in range(2):
			var enemy = enemy_scene.instantiate()
			add_child(enemy, true)
			await get_tree().create_timer(1).timeout
		for i in range(3):
			var fast_enemy = fenemy_scene.instantiate()
			add_child(fast_enemy, true)
			await get_tree().create_timer(0.5).timeout

func _process(delta: float) -> void:
	if get_child_count() == 0:
		waveCount += 1
		wave(waveCount)
