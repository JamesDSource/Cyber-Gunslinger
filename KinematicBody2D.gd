extends KinematicBody2D
const RETURN = Vector2(0,0)
const SPEED = 200

var changedirectionbuffer = 0
var direction = Vector2(1,0)
var motion = Vector2()

func _physics_process(delta):
	motion = direction * SPEED
	$RayCast2D.enabled = true
	$RayCast2D.cast_to = direction * 20
	changedirectionbuffer-=1
	if $RayCast2D.is_colliding() and changedirectionbuffer < 0:
		changedirectionbuffer = 10
		direction.x *= -1
		direction.y *= -1
		print("String changing direction")
	motion = move_and_slide(motion)
	pass

