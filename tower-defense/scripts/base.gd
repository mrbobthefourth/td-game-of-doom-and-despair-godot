extends Area2D

@export var godMode = false

func _process(delta: float) -> void:
	if godMode == false:
		if Carrier.baseHP == 0:
			get_tree().quit()


func _on_area_entered(area: Area2D) -> void:
	area.get_parent().queue_free()
	if godMode == false:
		Carrier.baseHP -= 1
