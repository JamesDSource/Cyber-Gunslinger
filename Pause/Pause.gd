extends Control

var pauseState

func _input(event):
	if event.is_action_pressed("Pause"):
		pauseState = not get_tree().paused
		get_tree().paused = pauseState
		visible = pauseState



func _on_Resume_pressed():
	pauseState = not get_tree().paused
	get_tree().paused = pauseState
	visible = pauseState


func _on_Quit_pressed():
	pass
