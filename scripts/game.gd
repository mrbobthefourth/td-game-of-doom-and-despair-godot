extends Node2D

var current_tower = null
@onready var guntower_scene = preload("res://scenes/gun_base.tscn")
@onready var frztower_scene
var placing_guntower = false
var placing_frztower = false

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
	if placing_guntower and current_tower:
		current_tower.global_position = get_global_mouse_position()

func _unhandled_input(event):
	if placing_guntower and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if current_tower.can_place == true:
				current_tower.place()
				placing_guntower = false
				current_tower.active = true
				Carrier.money -= 25

func place_guntower(pos):
	var tower = guntower_scene.instantiate()
	tower.global_position = pos
	add_child(tower)
	current_tower = tower


func _on_gun_tower_button_pressed() -> void:
	if Carrier.money > 24:
		placing_guntower = true
		place_guntower(get_global_mouse_position())
	


func _on_freezer_tower_button_pressed() -> void:
	pass # Replace with function body.
