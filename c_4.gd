extends bomb_base

@onready var sprite = $animator

func explode():
	sprite.play("explosion_plus")
	if playerIsInExplosionArea:
		playerExploded.emit(position)
		
