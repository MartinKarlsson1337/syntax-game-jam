extends AnimatedSprite2D

signal level_up
var xp : int = 0
var needed : float = 12

func gain_xp(amount):
	xp += amount
	while xp >= needed:
		play('6')
		xp = xp - needed
		level_up.emit()
	play(str(int(xp/needed * 6)))
	
