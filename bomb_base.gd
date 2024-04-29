extends RigidBody2D
class_name bomb_base
@onready var throw_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
@onready var animator = $animator
@onready var throw = $throwSound
@onready var explosion = $explosion
@onready var explode_timer = $explodeTimer
var xp = preload("res://xp.tscn")
@export var speed = 1000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
var playerIsInExplosionArea = false
var xp_amount = 1
var amount_of_xp_picked_up = 0
signal playerExploded
signal all_xp_picked_up

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = linear_velocity.lerp(throw_direction * speed, acceleration)
	playerExploded.connect(get_parent()._on_player_exploded)
	throw.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = linear_velocity.lerp(Vector2.ZERO, friction)

func explode():
	animator.play("explode")
	explosion.play()
	drop_xp()
	if playerIsInExplosionArea:
		playerExploded.emit(position)
		
	
func delete():
	queue_free()


func _on_explode_timer_timeout():
	explode()


func _on_explosion_area_body_entered(body):
	if body.name == "PlayerBody":
		playerIsInExplosionArea = true

func pause():
	explode_timer.paused = true

func resume():
	explode_timer.paused = false
	animator.get_sprite_frames()

func drop_xp():
	var instance
	for i in range(xp_amount):
		instance = xp.instantiate()
		add_child(instance)

func _on_xp_picked_up():
	amount_of_xp_picked_up += 1
	if amount_of_xp_picked_up == xp_amount:
		all_xp_picked_up.emit(xp_amount)
		delete()

func _on_explosion_area_body_exited(body):
	if body.name == "PlayerBody":
		playerIsInExplosionArea = false
		
