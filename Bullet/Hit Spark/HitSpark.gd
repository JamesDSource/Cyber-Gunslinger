extends AnimatedSprite



func _on_HitSpark_animation_finished():
	queue_free()
