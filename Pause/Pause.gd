extends Control

func _input(event):
	if event.is_action_pressed("Pause"):
		get_tree().paused = !get_tree().paused
		visible = !visible



func _on_Resume_pressed():
	get_tree().paused = !get_tree().paused
	visible = !visible


func _on_Quit_pressed():
	get_tree().quit()
