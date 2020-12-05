extends KinematicBody2D

const GRAVITY = 10
const SPEED = 200
const JUMP = -400

var animation = "Idle"
var animationSet = ""

var motion = Vector2()

func _ready():
	pass

func _process(delta):
	if animation != animationSet:
		$AnimationPlayer.play(animation)
		animationSet = animation

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("Left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
	elif Input.is_action_pressed("Right"):
		motion.x = SPEED
		$Sprite.flip_h = false
	else:
		motion.x = 0
	
	if is_on_floor():
		if motion.x == 0:
			animation = "Idle"
		else:
			animation = "Run"

		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
	else:
		if motion.y > 0:
			animation = "Fall"
		else:
			animation = "Jump"
	
	motion = move_and_slide(motion, Vector2.UP)
