extends Node2D

func _ready():
	$AnimationPlayer.play("fade_out")

func _on_tutorial_timer_timeout():
	queue_free()
