extends Node2D

var xp = preload("res://xp.tscn")
signal xp_collected
var number_of_xp_spawned = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_xp():
	if number_of_xp_spawned <= 6:
		number_of_xp_spawned = number_of_xp_spawned + 1
		var instance = xp.instantiate()
		add_child(instance)
	


func _on_timer_timeout():
	spawn_xp()
