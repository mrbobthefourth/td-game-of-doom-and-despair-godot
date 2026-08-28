extends "res://scripts/enemy_collective.gd"

@onready var summon_scene = preload("res://scenes/path_enemy.tscn")
@onready var summon_scene2 = preload("res://scenes/fast_enemy.tscn")
@onready var summon_scene3 = preload("res://scenes/tank_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if health <= 0:
		Carrier.money += 3
		queue_free()


func _on_timer_timeout() -> void:
	modulate = Color.YELLOW
	if randi_range(0, 1) == 0:
		await get_tree().create_timer(0.5).timeout
		var summon = summon_scene.instantiate()
		summon.progress = progress + 10
		get_parent().add_child(summon)
	else:
		if randi_range(2, 3) == 2:
			await get_tree().create_timer(0.5).timeout
			var summon = summon_scene2.instantiate()
			summon.progress = progress + 10
			get_parent().add_child(summon)
		else:
			await get_tree().create_timer(0.5).timeout
			var summon = summon_scene3.instantiate()
			summon.progress = progress + 10
			get_parent().add_child(summon)
	modulate = Color.WHITE
