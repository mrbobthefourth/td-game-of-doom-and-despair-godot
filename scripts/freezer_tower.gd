extends Node2D

@export var MenuRect = ColorRect
var camo_detection
var can_place = false
var has_target = false
var active = false
var target = null
var enemies_in_range = []
#var can_place = false
@onready var bullet_scene = preload("res://scenes/freeze_bullet.tscn")
@onready var top_scene = preload("res://scenes/freezer_cannon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cannon = top_scene.instantiate()
	add_child(cannon)
	get_parent().clicked_outside_ui.connect(Callable(self, "clicked_outside_ui"))
func place():
	$Sprite2D.modulate = Color.WHITE
	$freezer_cannon/Sprite2D.modulate = Color.WHITE

func _process(delta: float) -> void:
	$Button.disabled = !active
	if enemies_in_range.size() != 0:
		if enemies_in_range[0].get("slowed") != null:
			if enemies_in_range[0].slowed == false:
				enemies_in_range.remove_at(0)
	choose_target()
	can_place = !$Area2D.has_overlapping_areas()
	if can_place == false:
		$Sprite2D.modulate = Color.RED
		$freezer_cannon/Sprite2D.modulate = Color.RED
	else:
		$Sprite2D.modulate = Color.WHITE
		$freezer_cannon/Sprite2D.modulate = Color.WHITE
	if active and is_instance_valid(target):
		$freezer_cannon.look_at(target.global_position)


func _on_range_area_2d_area_entered(area: Area2D) -> void:
		enemies_in_range.append(area)



func _on_range_area_2d_area_exited(area: Area2D) -> void:
	enemies_in_range.erase(area)
	if area == target:
		target = null

func choose_target():
	if not enemies_in_range.size() == 0:
		target = enemies_in_range[0]
		has_target = true
	else:
		has_target = false


func _on_timer_timeout() -> void:
	if active and has_target:
		var bullet = bullet_scene.instantiate()
		bullet.global_rotation = $freezer_cannon.global_rotation
		add_child(bullet, true)


func _on_button_pressed() -> void:
	$MenuRect.visible = true

func clicked_outside_ui():
	$MenuRect.visible = false


func _on_sell_pressed() -> void:
	queue_free()
	Carrier.money += 21
