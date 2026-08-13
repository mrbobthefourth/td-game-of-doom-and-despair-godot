extends Node2D

@onready var explosion = preload("res://scenes/explosion_bullet.tscn")

var speed = 2000

func _process(delta: float) -> void:
	position += transform.x * speed * delta

func explode():
	var effect = explosion.instantiate()
	add_child(effect, true)
	queue_free()
