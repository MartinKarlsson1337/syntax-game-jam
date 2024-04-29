extends AnimatedSprite2D

var level = 1
var max_level = 5
var upgrade_name
signal upgraded

func _ready():
	upgrade_name = name

func upgrade():
	level = level + 1
	if level < max_level:
		play(str(level))
	else:
		play(str(level))
		get_child(0).set_deferred('visible', false)
	

func set_level(new_level):
	for i in range(new_level-1):
		upgrade()

func _on_upgrade_button_button_pressed():
	upgrade()
	upgraded.emit(level, upgrade_name)
	
