extends PathFollow2D

var health = 1
@export var speed = 100

func _ready() -> void:
	progress = 0

func _process(delta: float) -> void:
	progress -= speed * delta
	if progress <= 10 or health <= 0:
		queue_free()
