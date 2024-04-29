extends bomb_base

@onready var explosion_animator = $explosion_animator
@onready var timer = $explodeTimer
var animationStage = "stage_1"

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (timer.is_stopped()):
		return
	elif (timer.get_time_left() < (timer.wait_time / 3.0)):
		animationStage = "stage_3"
	elif (timer.get_time_left() < (2 * timer.wait_time / 3.0)): 
		animationStage = "stage_2"
	animator.play(animationStage)
	
	linear_velocity -= linear_velocity * friction * delta
	pass

func explode():
	animator.hide() # Hide first animator
	explosion_animator.play("big_explosion")
	if playerIsInExplosionArea:
		playerExploded.emit(position)


func pause():
	get_child(3).paused = true
	get_child(4).paused = true
	animator.stop()
	explosion_animator.stop()

func resume():
	get_child(3).paused = false
	get_child(4).paused = false
	animator.play()
	explosion_animator.play()
