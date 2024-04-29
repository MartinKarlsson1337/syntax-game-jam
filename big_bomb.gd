extends bomb_base

@onready var timer = $explodeTimer
var animationStage = "stage_1"

func _process(delta):
	if (timer.is_stopped()):
		return
	elif (timer.get_time_left() < (timer.wait_time / 3.0)):
		animationStage = "stage_3"
	elif (timer.get_time_left() < (2 * timer.wait_time / 3.0)): 
		animationStage = "stage_2"
	animator.play(animationStage)
	super._process(delta)
		


