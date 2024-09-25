extends Node

func _ready():
	add(3,8)
	add(245,90)

func _add(num1, num2):
	var result = num1 + num2
	print(result)
