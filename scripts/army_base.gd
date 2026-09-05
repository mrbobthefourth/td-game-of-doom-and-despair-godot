extends Node2D

var active = false
var can_place = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !active:
		if $Area2D.has_overlapping_areas() ==false:
			can_place = true
		else: 
			can_place = false

func place():
	modulate = Color.WHITE

func _on_timer_timeout() -> void:
	if active:
		get_parent().get_node("Path").add_child(preload("res://scenes/army_man.tscn").instantiate(), true)
