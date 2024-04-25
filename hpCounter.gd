extends Node2D

@export var hp = 3
var heart_scene = preload("res://heart.tscn")
var hearts = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(hp):
		var instance = heart_scene.instantiate()
		instance.position.y = 0
		instance.position.x = 0 + 18*i
		print(instance.position)
		self.add_child(instance)
		hearts.append(instance)

func destroy_heart():
	hearts[hearts.size()-1].get_child(0).play('spin_and_disappear')
	hearts.pop_back()
