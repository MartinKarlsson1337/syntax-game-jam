extends AnimatedSprite2D

var mouse_over = false
signal button_pressed
@export var text = ""
var label : Label
# Called when the node enters the scene tree for the first time.
func _ready():
	self.label = $Label
	self.label.text = self.text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed == false:
			play("default")
			label.position.y = label.position.y - 1
			button_pressed.emit()
		else:
			play("press")
			label.position.y = label.position.y + 1
			
			
