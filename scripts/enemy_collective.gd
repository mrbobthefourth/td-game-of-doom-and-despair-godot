extends PathFollow2D

var camo = false
var slowed = false
const MAX_HP = 3
@export var health = MAX_HP
@export var speed = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if health <= 0:
		Carrier.money += 3
		queue_free()




func _on_area_2d_area_entered(area: Area2D) -> void:
	if "freeze" in area.name:
		area.queue_free()
		if not slowed:
			speed = speed / 2
			slowed = true
	elif "bullet" in area.name:
		health -= 1
		area.queue_free()
	elif "projectile" in area.name:
		area.explode()
	elif "explosion" in area.name:
			health -= 1
