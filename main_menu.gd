extends Node2D

func _on_quit_button_pressed():
	get_parent().go_to_state('quit')


func _on_start_button_pressed():
	get_parent().go_to_state('play')
	
