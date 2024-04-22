extends RigidBody2D

@onready var throwDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
@onready var animator = $animator
@export var speed = 100
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = linear_velocity.lerp(throwDirection * speed, acceleration)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = linear_velocity.lerp(Vector2.ZERO, friction)
	pass

func explode():
	animator.play("explode")
	
func delete():
	queue_free()


func _on_explode_timer_timeout():
	explode()


func _on_delete_timer_timeout():
	delete()

