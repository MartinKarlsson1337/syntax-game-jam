extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_button_pressed():
	get_parent().go_to_state('play')


func _on_quit_button_pressed():
	get_parent().go_to_state('quit')
