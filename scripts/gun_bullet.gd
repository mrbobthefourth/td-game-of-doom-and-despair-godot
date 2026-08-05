extends Area2D

var speed = 2000

func _process(delta: float) -> void:
		position += transform.x * speed * delta
