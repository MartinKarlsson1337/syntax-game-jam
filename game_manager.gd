extends Node2D

var c4 = preload("res://c_4.tscn")
var playerPosition = Vector2.ZERO
@onready var player = $PlayerBody

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerPosition =  player.position
	pass

func spawn_c4(at_position):
	var instance = c4.instantiate()
	instance.position = at_position
	add_child(instance)


func _on_bomb_timer_timeout():
	spawn_c4(playerPosition)
