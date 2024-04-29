extends AnimatedSprite2D

signal level_up
var xp = 0

func gain_xp(amount):
	xp += amount
	while xp >= 6:
		play('6')
		xp = xp - 6
		level_up.emit()
	play(str(xp))
	
