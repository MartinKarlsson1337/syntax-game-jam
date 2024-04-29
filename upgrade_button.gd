extends AnimatedSprite2D

signal button_pressed

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed == false:
			play("default")
			button_pressed.emit()
		else:
			play("press")

