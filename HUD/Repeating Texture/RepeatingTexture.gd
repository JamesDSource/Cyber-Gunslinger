tool
extends Control

export var hide = 0

func _process(delta):
	var children = get_children()
	var i = 0
	for child in children:
		child.visible = false if i < hide else true
		i+=1
