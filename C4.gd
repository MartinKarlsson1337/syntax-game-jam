extends RigidBody2D

@onready var throwDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
@onready var animator = $animator
@export var speed = 100
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
var playerIsInExplosionArea = false
signal playerExploded
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = linear_velocity.lerp(throwDirection * speed, acceleration)
	playerExploded.connect(get_parent()._on_player_exploded)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = linear_velocity.lerp(Vector2.ZERO, friction)
	pass

func explode():
	animator.play("explode")
	if playerIsInExplosionArea:
		playerExploded.emit(position)
		
	
func delete():
	queue_free()


func _on_explode_timer_timeout():
	explode()


func _on_delete_timer_timeout():
	delete()



func _on_explosion_area_body_entered(body):
	if body.name == "PlayerBody":
		playerIsInExplosionArea = true



func _on_explosion_area_body_exited(body):
	if body.name == "PlayerBody":
		playerIsInExplosionArea = false
