extends KinematicBody2D

var hurt_groups = []
var direction = Vector2(1, 1)
export var speed = 20

func _physics_process(delta):
	move_and_collide(direction * speed, false)

func _process(delta):
	var rotation_angle = rad2deg(direction.angle())
	rotation_degrees = rotation_angle

func _on_Hitbox_body_entered(body):
	for group in hurt_groups:
		if body.is_in_group(group): # damage
			pass
	queue_free()
