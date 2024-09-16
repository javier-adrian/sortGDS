extends Node2D

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_released("reshuffle"):
		$Bar.array.shuffle()
	if Input.is_action_pressed("sort"):
		$Bar.bubble_sort()
	# 	$Bar.sorting = true
	# if Input.is_action_just_released("sort"):
	# 	$Bar.sorting = false

