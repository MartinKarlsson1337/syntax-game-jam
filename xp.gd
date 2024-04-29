extends Sprite2D

@export var x_bounds = [-180, 180]
@export var y_bounds = [-90, 90]
signal picked_up
var player_detected = false
var player : CharacterBody2D

func _ready():
	picked_up.connect(get_parent()._on_xp_picked_up)
	
func _process(delta):
	if player_detected && get_parent().get_child(1):
		var direction  = get_parent().position.direction_to(player.position) 
		var distance = get_parent().position.distance_to(player.position) 
		get_parent().position += (direction * delta * 100)
		
		
func _on_area_2d_body_entered(body):
	picked_up.emit()


func _on_magnet_zone_body_entered(body):
	if body.name == "PlayerBody":
		player_detected = true
		player = body


func _on_magnet_zone_body_exited(body):
	player_detected = false
