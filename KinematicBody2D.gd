extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200


var motion = Vector2()

func _physics_process(delta):
	motion.y += 10
	
	if Input.is_on_wall("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false;
		$Sprite.play("Run")
	elif Input.is_on_wall("ui_left"):
		motion.x = - SPEED
		$Sprite.flip_h = true;
		$Sprite.play("Run")
	else:
		motion.x = 0
	
			
	motion = move_and_slide(motion)
	pass

