extends KinematicBody2D
const SPEED = 200

var direction = Vector2(1,0)
var motion = Vector2()

func _physics_process(delta):
	motion = direction * SPEED
	$RayCast2D.cast_to = direction * 10
	
	motion = move_and_slide(motion)
	pass
