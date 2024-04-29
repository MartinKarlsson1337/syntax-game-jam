extends Node2D

var dir 
@onready var keys = {'up': $up,'down':$down, 'left':$left ,'right' : $right}


func _process(delta):
	if Input.is_action_pressed('right'):
		keys['right'].play('press')
	else:
		keys['right'].play('default')
	if Input.is_action_pressed('left'):
		keys['left'].play('press')
	else:
		keys['left'].play('default')
	if Input.is_action_pressed('down'):
		keys['down'].play('press')
	else:
		keys['down'].play('default')
	if Input.is_action_pressed('up'):
		keys['up'].play('press')
	else:
		keys['up'].play('default')
			

