extends Node2D


var bombs = [preload("res://grenade.tscn"), preload("res://c_4.tscn"), preload("res://big_bomb.tscn")]
var playerPosition = Vector2.ZERO
@onready var player = $PlayerBody
@onready var hp = $hp_counter
var playerHealth = 3
var playerLevel = 1
@export var push_speed = 1000
@export var acceleration = 0.25
var input_active = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerPosition =  player.position
	if Input.is_action_pressed('pause'):
		get_parent().go_to_state('pause')

func spawn_random_bomb(at_position):
	if input_active:
		var instance = bombs.pick_random().instantiate()
		instance.position = at_position
		add_child(instance)

func _on_player_exploded(bomb_position):
	playerHealth = playerHealth-1
	push_player(player.position - bomb_position)
	hp.destroy_heart()
	if playerHealth <= 0:
		get_parent().go_to_state('game_over')

func push_player(direction):
	player.input_active = false
	player.velocity = direction.normalized() * push_speed
	player.input_active = true


func _on_spawn_bomb_timer_timeout():
	spawn_random_bomb(playerPosition)

func pause():
	input_active = false
	get_child(0).input_active = false
	pause_bombs()
	
func resume():
	input_active = true
	get_child(0).input_active = true
	resume_bombs()
	
func pause_bombs():
	var children = get_children()
	var bombs = children.slice(6, children.size())
	for bomb in bombs:
		bomb.pause()
		
func resume_bombs():
	var children = get_children()
	var bombs = children.slice(5, children.size())
	for bomb in bombs:
		bomb.resume()
<<<<<<< Updated upstream
=======

func gain_xp(amount):
	xp_bar.gain_xp(amount)

func _on_xp_bar_level_up():
	playerLevel += 1
	print("Leveled up to lvl. " + str(playerLevel))

func instantiate_warning(warning, future_position):
	var warning_instance = warning.instantiate()
	warning_instance.new_position(future_position)  # Custom function to set position
	add_child(warning_instance)
	return warning_instance
	
	
>>>>>>> Stashed changes
