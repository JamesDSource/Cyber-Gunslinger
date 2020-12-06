extends AnimatedSprite

export(PackedScene) var level_goto

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to(level_goto)
