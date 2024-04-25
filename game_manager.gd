extends Node2D

var c4 = preload("res://c_4.tscn")
var playerPosition = Vector2.ZERO
@onready var player = $PlayerBody
@onready var hp = $hpCounter
var playerHealth = 3
@export var push_speed = 1000
@export var acceleration = 0.25

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerPosition =  player.position
	pass

func spawn_c4(at_position):
	var instance = c4.instantiate()
	instance.position = at_position
	add_child(instance)

func _on_player_exploded(bomb_position):
	playerHealth = playerHealth-1
	push_player(player.position - bomb_position)
	hp.destroy_heart()
	if playerHealth <= 0:
		get_tree().reload_current_scene()

func _on_bomb_timer_timeout():
	spawn_c4(playerPosition)

func push_player(direction):
	player.input_active = false
	player.velocity = direction.normalized() * push_speed
	player.input_active = true
