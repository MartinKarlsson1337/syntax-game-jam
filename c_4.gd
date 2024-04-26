extends bomb_base

func explode():
	animator.play("explosion_plus")
	if playerIsInExplosionArea:
		playerExploded.emit(position)

