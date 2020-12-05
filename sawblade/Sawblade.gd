extends KinematicBody2D
const SPEED = 200

var changedirectionbuffer = 0
export var direction = Vector2(1,0)
var motion = Vector2()

func _physics_process(delta):
	motion = direction * SPEED
	$RayCast2D.enabled = true
	$RayCast2D.cast_to = direction * 20
	changedirectionbuffer-=1
	if $RayCast2D.is_colliding() && !$RayCast2D.get_collider().is_in_group("Player") && changedirectionbuffer < 0:
		changedirectionbuffer = 10
		direction.x *= -1
		direction.y *= -1
	motion = move_and_slide(motion)


func _on_Hitbox_body_entered(body):
	if body.is_in_group("Player"):
		body.damage(1)
