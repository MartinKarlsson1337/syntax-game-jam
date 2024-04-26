extends Sprite2D

@export var x_bounds = [-180, 180]
@export var y_bounds = [-90, 90]
signal picked_up
# Called when the node enters the scene tree for the first time.
func _ready():
	picked_up.connect(get_parent()._on_xp_picked_up)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	picked_up.emit()
