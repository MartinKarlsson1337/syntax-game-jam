extends Node2D

var size = 100 # radius
@onready var animator = $Sprite2D/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animator.play("fade_out")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($DeleteTimer.is_stopped()):
		queue_free() # Delete
	pass

func new_position(_position):
	position = _position
	
func rescale_warning(_scale):
	$Sprite2D.scale = Vector2(_scale, _scale)
	
	var anim = $Sprite2D/AnimationPlayer.get_animation("fade_out")
	var track_idx = anim.find_track("Sprite2D:scale", 0)
	anim.track_set_key_value(track_idx, 0, Vector2(_scale, _scale))


func pause():
	pass

func resume():
	pass
