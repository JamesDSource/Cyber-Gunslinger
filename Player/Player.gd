extends KinematicBody2D

const GRAVITY = 10
const SPEED = 200
const JUMP = -300

var animation = "Idle"
var animationSet = ""

var motion = Vector2()

func _ready():
	pass

func _process(delta):
	if animation != animationSet:
		$AnimationPlayer.play(animation)
		animationSet = animation
	
	var gun_angle = rad2deg($Sprite/GunPosition.global_position.angle_to_point(get_global_mouse_position())) + 180
	$Sprite/GunPosition.scale.y = -1 if gun_angle > 90 && gun_angle < 270 else 1
	$Sprite/GunPosition.scale.y *= $Sprite.scale.x
	$Sprite/GunPosition.look_at(get_global_mouse_position())
func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("Left"):
		motion.x = -SPEED
		$Sprite.scale.x = -1
	elif Input.is_action_pressed("Right"):
		motion.x = SPEED
		$Sprite.scale.x = 1
	else:
		motion.x = 0
	
	if is_on_floor():
		if motion.x == 0:
			animation = "Idle"
		else:
			animation = "Run"

		if Input.is_action_just_pressed("Jump"):
			motion.y = JUMP
	else:
		if motion.y > 0:
			animation = "Fall"
		else:
			animation = "Jump"
	
	motion = move_and_slide(motion, Vector2.UP)
