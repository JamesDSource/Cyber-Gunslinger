extends Control 

func _ready():
	get_tree().paused = false

func _on_StartGame_pressed():
	get_tree().change_scene("res://Game/Game.tscn")

func _on_Exit_pressed():
	get_tree().quit()
