extends KinematicBody2D

var variable = "whatever"

var speed = 10

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	var direction = 0
	if Input.is_action_pressed("Left"):
		direction += -1	
	if Input.is_action_pressed("Right"):
		direction += 1
	
	move_and_slide(Vector2(direction * speed, 0), Vector2.UP)
