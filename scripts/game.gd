extends Node2D

var current_tower = null
@onready var tower_scene = preload("res://scenes/gun_base.tscn")
var placing_tower = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HPlabel.text = "HP:" + str(Carrier.baseHP)
	if Carrier.money < 9999:
		$CoinsLabel.text = str(Carrier.money)
	elif Carrier.money < 1000000:
		$CoinsLabel.text = str(Carrier.money / 1000) + "K"
	$WaveCounter.text = "WAVE" + str($Path.waveCount)
	if placing_tower and current_tower:
		current_tower.global_position = get_global_mouse_position()

func _unhandled_input(event):
	if placing_tower and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if current_tower.can_place == true:
				current_tower.place()
				placing_tower = false
				current_tower.active = true
				Carrier.money -= 20

func place_tower(pos):
	var tower = tower_scene.instantiate()
	tower.global_position = pos
	add_child(tower)
	current_tower = tower


func _on_gun_tower_button_pressed() -> void:
	if Carrier.money > 19:
		placing_tower = true
		place_tower(get_global_mouse_position())
	
