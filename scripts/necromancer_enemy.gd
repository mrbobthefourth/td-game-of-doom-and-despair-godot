extends "res://scripts/enemy_collective.gd"

@onready var summon_scene = preload("res://scenes/path_enemy.tscn")

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
	modulate = Color.BLUE
	await get_tree().create_timer(0.5).timeout
	var summon = summon_scene.instantiate()
	summon.progress = progress
	get_parent().add_child(summon)
	modulate = Color.WHITE
