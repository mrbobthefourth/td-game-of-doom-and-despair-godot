extends Node

@onready var bird_scene = preload("res://scenes/bird.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if randi_range(0, 1) == 1:
		var bird = bird_scene.instantiate()
		add_child(bird)
