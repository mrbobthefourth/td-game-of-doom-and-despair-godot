extends PathFollow2D

const MAX_HP = 3
var health = MAX_HP
const SPEED = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += SPEED * delta
	if health == 0:
		queue_free()




func _on_area_2d_area_entered(area: Area2D) -> void:
	health -= 1
	area.queue_free()
