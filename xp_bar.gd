extends AnimatedSprite2D

signal level_up
var xp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gain_xp(amount):
	xp += amount
	while xp >= 6:
		xp = xp - 6
		level_up.emit()
	play(str(xp))
	
