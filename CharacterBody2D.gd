extends CharacterBody2D

@export var speed = 200
@export var friction = 0.01
@export var acceleration = 0.1
@onready var animator = $AnimatedSprite2D
var direction = ''

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		direction = 'right'
		input.x += 1
	if Input.is_action_pressed('left'):
		direction = 'left'
		input.x -= 1
	if Input.is_action_pressed('down'):
		direction = 'down'
		input.y += 1
	if Input.is_action_pressed('up'):
		direction = 'up'
		input.y -= 1
	else:
		direction = 'idle'
	play_anim(direction)
	return input

func play_anim(animation_name):
	if direction != animation_name:
		animator.play(animation_name)

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
