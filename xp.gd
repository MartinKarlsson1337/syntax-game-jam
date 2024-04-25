extends Sprite2D

@export var x_bounds = [-180, 180]
@export var y_bounds = [-90, 90]
# Called when the node enters the scene tree for the first time.
func _ready():
	var x = randf_range(x_bounds[1], x_bounds[0])
	var y = randf_range(y_bounds[1], y_bounds[0])
	position = Vector2(x, y)
	print("Spawned xp at: " + str(position))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	queue_free()
