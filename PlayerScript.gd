extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@export var speed = 100
@export_range(0.0, 1.0) var friction = 0.4
@export_range(0.0 , 1.0) var acceleration = 0.1
var dir = 'default'
var input_active = true

func _process(_delta):
	if input_active:
		sprite.play(dir)
	else:
		sprite.stop()

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
		dir = 'right'
	if Input.is_action_pressed('left'):
		input.x -= 1
		dir = 'left'
	if Input.is_action_pressed('down'):
		input.y += 1
		dir = 'down'
	if Input.is_action_pressed('up'):
		input.y -= 1
		dir = 'up'
		
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0 and input_active:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
		dir = 'idle'
	move_and_slide()

