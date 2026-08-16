extends Node2D

var current_tower = null
@onready var guntower_scene = preload("res://scenes/gun_base.tscn")
@onready var frztower_scene = preload("res://scenes/freezer_base.tscn")
@onready var bmbtower_scene = preload("res://scenes/bomb_tower.tscn")
var placing_guntower = false
var placing_frztower = false
var placing_bmbtower = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HPlabel.text = "HP:" + str(Carrier.baseHP)
	if Carrier.money < 9999:
		$CoinsLabel.text = str(Carrier.money)
	elif Carrier.money < 100000:
		$CoinsLabel.text = str(Carrier.money / 100) + "K"
	$WaveCounter.text = "WAVE" + str($Path.waveCount)
	if Carrier.money < 25:
		$CanvasLayer/GunTowerButton.modulate = Color.RED
	else:
		$CanvasLayer/GunTowerButton.modulate = Color.WHITE
	if Carrier.money < 30:
		$CanvasLayer/FreezerTowerButton.modulate = Color.RED
	else:
		$CanvasLayer/FreezerTowerButton.modulate = Color.WHITE
	if Carrier.money < 50:
		$CanvasLayer/BombTowerButton.modulate = Color.RED
	else:
		$CanvasLayer/BombTowerButton.modulate = Color.WHITE
	if (placing_guntower or placing_frztower or placing_bmbtower) and current_tower:
		current_tower.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("debug"):
		Carrier.money += 10
	if Input.is_action_just_pressed("debug-"):
		Carrier.money -= 10
	if Input.is_action_just_pressed("debug*"):
		Carrier.money += 1

func _unhandled_input(event):
	if (placing_guntower or placing_frztower or placing_bmbtower) and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if current_tower.can_place == true:
				current_tower.place()
				if placing_guntower == true:
					placing_guntower = false
					Carrier.money -= 25
					print("gun")
				elif placing_frztower == true:
					placing_frztower = false
					Carrier.money -= 30
					print("freeze")
				elif placing_bmbtower == true:
					placing_bmbtower = false
					Carrier.money -= 50
					print("bomb")
				current_tower.active = true

func place_guntower(pos):
	var tower = guntower_scene.instantiate()
	tower.global_position = pos
	add_child(tower)
	current_tower = tower

func place_frztower(pos):
	var tower = frztower_scene.instantiate()
	tower.global_position = pos
	add_child(tower)
	current_tower = tower

func place_bmbtower(pos):
	var tower = bmbtower_scene.instantiate()
	tower.global_position = pos
	add_child(tower)
	current_tower = tower

func _on_gun_tower_button_pressed() -> void:
	if Carrier.money >= 25:
		placing_guntower = true
		place_guntower(get_global_mouse_position())


func _on_freezer_tower_button_pressed() -> void:
	if Carrier.money >= 30:
		placing_frztower = true
		place_frztower(get_global_mouse_position())


func _on_bomb_tower_button_pressed() -> void:
	if Carrier.money >= 30:
		placing_bmbtower = true
		place_bmbtower(get_global_mouse_position())
