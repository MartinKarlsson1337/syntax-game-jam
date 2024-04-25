extends Node2D

var xp = 0
var segments

# Called when the node enters the scene tree for the first time.
func _ready():
	segments = get_children()
	for x in range(4):
		gain_xp()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gain_xp():
	xp = xp + 1
	match xp:
		1:
			segments[0].play('half')
		2:
			segments[0].play('full')
			segments[1].play('half')
		3:
			for i in range(xp):
				if i+1 == xp:
					segments[i].play('half')
				else:
					segments[i].play('full')
		4:
			for i in range(4):
					segments[i].play('full')
			segments[4].play('half')
		5:
			for i in range(5):
					segments[i].play('full')
		6:
			for i in segments:
				i.play('full')
		
