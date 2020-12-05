extends KinematicBody2D

const GRAVITY = 10
const SPEED = 100
const JUMP = -400

var motion = Vector2()

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("Left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("Right"):
		motion.x = SPEED
	else:
		motion.x = 0
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = JUMP
	
	motion = move_and_slide(motion, Vector2.UP)
