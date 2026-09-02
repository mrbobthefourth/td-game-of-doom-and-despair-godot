extends Area2D

@onready var explosion = preload("res://scenes/explosion_bomb.tscn")

var speed = 500

func _process(delta: float) -> void:
	position += transform.x * speed * delta


func explode()-> void:
	var effect = explosion.instantiate()
	effect.position = position
	get_parent().add_child(effect, true)
	queue_free()


func _on_timer_timeout() -> void:
	modulate = Color.RED
	await get_tree().create_timer(0.3).timeout
	explode()
