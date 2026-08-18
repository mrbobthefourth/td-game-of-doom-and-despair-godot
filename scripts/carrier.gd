extends Node

var money = 25
var baseHP = 15
var baseDecrease = 1

func _process(delta: float) -> void:
	baseDecrease -= 0.008 * delta
	print(max(1, round(4 * baseDecrease) as int))
