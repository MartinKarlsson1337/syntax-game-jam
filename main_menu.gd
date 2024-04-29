extends Node2D
@onready var fade_out = $AnimationPlayer
@onready var blip = $blip
@onready var bomb_animator = $Bomb_Sprite/Bomb_animation

func _on_quit_button_pressed():
	get_parent().go_to_state('quit')


func _on_start_button_pressed():
	fade_out.play('fade_out')
	blip.play()
	await get_tree().create_timer(1).timeout
	get_parent().go_to_state('play')
	
	
func _ready():
	print("hello world")
	bomb_animator.play("bomb_shake")
