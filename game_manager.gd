extends Node2D

var bombs = [preload("res://big_bomb.tscn")] # preload("res://grenade.tscn") removed this for now 
var playerPosition = Vector2.ZERO
@onready var player = $PlayerBody
@onready var hp = $hp_counter
@onready var soundtrack = $AudioStreamPlayer
@onready var fade_in = $AnimationPlayer
@onready var ouch = $ouch
@onready var xp_bar = $xp_bar
var playerHealth = 3
var playerLevel = 1
var multi_throw = 1
var fuse_time = 1
var bomb_radius = 1
var bomb_cooldown = 1
@export var push_speed = 300
@export var acceleration = 0.25
var input_active = true 
var skip

func _ready():
	skip = get_child_count()
	fade_in.play("fade_in")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerPosition =  player.position
	
	if Input.is_action_just_pressed('pause'):
		get_parent().go_to_state('pause')

func spawn_c4(at_position, amount):
	if input_active:
		for i in range(amount):
			var instance = bombs.pick_random().instantiate()
			instance.position = at_position
			instance.get_child(2).wait_time = 3 * 0.75 ** fuse_time
			instance.all_xp_picked_up.connect(gain_xp)
			add_child(instance)

func _on_player_exploded(bomb_position):
	playerHealth = playerHealth-1
	push_player(player.position - bomb_position)
	hp.destroy_heart()
	ouch.play()
	if playerHealth <= 0:
		soundtrack.stream_paused = true
		get_parent().go_to_state('game_over')

func push_player(direction):
	player.input_active = false
	player.velocity = direction.normalized() * push_speed
	player.input_active = true


func _on_spawn_bomb_timer_timeout():
	spawn_c4(playerPosition, multi_throw)

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
	var bombs = children.slice(skip, children.size())
	for bomb in bombs:
		bomb.pause()
		
func resume_bombs():
	var children = get_children()
	var bombs = children.slice(skip, children.size())
	for bomb in bombs:
		bomb.resume()

func gain_xp(amount):
	xp_bar.gain_xp(amount)

func _on_xp_bar_level_up():
	playerLevel += 1
	get_parent().go_to_state('upgrade')
	

func _on_upgraded(level, upgrade_name):
	print(upgrade_name)
	match upgrade_name:
		'bomb_radius':
			bomb_radius = bomb_radius + 1
			print(bomb_radius)
		'fuse_time':
			fuse_time = fuse_time + 1
			print(fuse_time)
		'bomb_cd':
			bomb_cooldown = bomb_cooldown + 1
			get_child(4).wait_time = 2 * 0.75 ** bomb_cooldown
			print(bomb_cooldown)
		'multi_throw':
			multi_throw = multi_throw + 1
			print(multi_throw)
	get_parent().go_to_state('play')
	

func instantiate_warning(warning, future_position):
	var warning_instance = warning.instantiate()
	warning_instance.new_position(future_position)  # Custom function to set position
	add_child(warning_instance)
	return warning_instance
	
