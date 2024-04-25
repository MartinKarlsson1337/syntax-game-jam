extends Node2D

var play_state = preload("res://play_state.tscn")
var main_menu = preload("res://main_menu.tscn")
var pause_state = preload("res://pause.tscn")
var states = ["default", "play", "pause", "main_menu", "game_over", "quit"]
var current_state = 'default'

func _ready():
	go_to_state('default')

func instantiate_state(state_scene):
	var instance = state_scene.instantiate()
	add_child(instance)

func go_to_play_state():
	if current_state == 'play':
		print("already in play")
	elif current_state == 'main_menu' or current_state == 'default':
		remove_child(get_child(0))
		instantiate_state(play_state)
	elif current_state == 'pause':
		remove_child(get_child(1))
		get_child(0).resume()
	else:
		instantiate_state(play_state)

func go_to_pause_state():
	if current_state == 'pause':
		print('already in pause')
	elif current_state == 'play':
		get_child(0).pause()
		instantiate_state(pause_state)

func go_to_main_menu():
	if current_state == 'main_menu':
		print('already in main menu')
	else:
		instantiate_state(main_menu)

func go_to_state(new_state):
	if new_state not in states:
		print('Not a valid state!')
	else:
		match new_state:
			'default':
				go_to_main_menu()
			'play':
				go_to_play_state()
			'pause':
				go_to_pause_state()
			'main_menu':
				remove_child(get_children()[0])
				go_to_main_menu()
			'game_over':
				go_to_main_menu()
			'quit':
				get_tree().quit()
		current_state = new_state
	
