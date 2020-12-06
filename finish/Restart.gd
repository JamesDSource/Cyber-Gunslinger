extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Restart_pressed():
	get_tree().change_scene("res://Game/Game.tscn")
	pass


func _on_StartMenu_pressed():
	get_tree().change_scene("res://titlescreen/MainScreen.tscn")
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
