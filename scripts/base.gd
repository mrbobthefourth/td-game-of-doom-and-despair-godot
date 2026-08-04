extends Area2D


func _on_area_entered(area: Area2D) -> void:
	Carrier.baseHP -= 1
	area.get_parent().queue_free()

func _process(delta: float) -> void:
	if Carrier.baseHP == 0:
		get_tree().quit()
