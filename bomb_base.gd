extends RigidBody2D
class_name bomb_base
@onready var throw_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
@onready var animator = $animator
<<<<<<< Updated upstream
@export var speed = 1000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
=======
@onready var throw = $throwSound
@onready var explosion = $explosion
@onready var explode_timer = $explodeTimer
var xp = preload("res://xp.tscn")
var warning = preload("res://warning_circle.tscn")
@export var speed = 400
@export_range(0.0, 1.0) var friction = 10
>>>>>>> Stashed changes
var playerIsInExplosionArea = false
signal playerExploded
<<<<<<< Updated upstream
=======
signal all_xp_picked_up
var counter = 0

>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = throw_direction * speed
	var future_position = calculate_stopping_position(linear_velocity)
	get_parent().instantiate_warning(warning, future_position)
	playerExploded.connect(get_parent()._on_player_exploded)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity -= linear_velocity * friction * delta

func calculate_stopping_position(_linear_velocity):
	var stopping_distance = _linear_velocity.length() / friction  # Calculate the stopping distance
	var stopping_vector = _linear_velocity.normalized() * stopping_distance  # Directional stopping distance
	var stopping_position = position + stopping_vector  # Compute final position vector
	return stopping_position

func explode():
	animator.play("explode")
	if playerIsInExplosionArea:
		playerExploded.emit(position)

func delete():
	queue_free()

func _on_explode_timer_timeout():
	explode()

<<<<<<< Updated upstream

func _on_delete_timer_timeout():
	delete()


=======
>>>>>>> Stashed changes
func _on_explosion_area_body_entered(body):
	if body.name == "PlayerBody":
		playerIsInExplosionArea = true

func pause():
	get_child(2).paused = true
	get_child(3).paused = true
	animator.stop()

func resume():
	get_child(2).paused = false
	get_child(3).paused = false
	animator.play()

func _on_explosion_area_body_exited(body):
	if body.name == "PlayerBody":
		playerIsInExplosionArea = false
		
