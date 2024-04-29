extends AnimatedSprite2D

signal level_up
var xp : int = 0
var level : int = 1
var multi_throw = 1
var needed : float = 12
@onready var lvl_label = $Label

func update_needed():
	needed = 8 * multi_throw + 2 * (level-1) 

func gain_xp(amount):
	xp += amount
	while xp >= needed:
		play('6')
		xp = xp - needed
		level += 1
		lvl_label.text = "Lvl. " + str(level)
		level_up.emit()
	play(str(int(xp/needed * 6)))
	
	
