extends Node2D
var player_dead = false
func _process(delta):
	visible = true if!(get_tree().paused) && player_dead else false
func _on_Restart_pressed():
	get_tree().reload_current_scene()
