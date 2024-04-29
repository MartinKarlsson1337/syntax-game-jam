extends Node2D

var size = 100 # radius

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("fade_out")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($DeleteTimer.is_stopped()):
		queue_free() # Delete
	pass

func new_position(_position):
	position = _position

func pause():
	pass

func resume():
	pass
