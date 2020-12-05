extends KinematicBody2D

enum STATE {
	IDLE
	CHASE,
	ATTACK
}
var state = STATE.IDLE
var target = null
var move_direction = Vector2()
var velocity = Vector2()
var speed = 100
var acceleration = 50

var hp = 3
func damage(hp_damage):
	hp = max(hp - hp_damage, 0)
	if hp <= 0:
		queue_free()

onready var nav = get_parent()

func _ready():
	add_to_group("Enemies")
	
func _process(delta):
	var can_see = false
	if target != null:
		$Sight.cast_to = target.global_position - global_position
		if $Sight.is_colliding() && $Sight.get_collider() == target:
			can_see = true
	
	match(state):
		STATE.IDLE:
			if target != null && can_see:
				state = STATE.CHASE
		
		STATE.CHASE:
			if can_see:
				state = STATE.ATTACK
			var path = nav.get_simple_path(global_position, nav.get_closest_point(target.global_position))
			if path.size() > 1:
				var direction = path[1] - global_position
				move_direction = direction.normalized()
		
		STATE.ATTACK:
			if !can_see:
				state = STATE.CHASE

func _physics_process(delta):
	velocity = velocity.linear_interpolate(move_direction*speed, acceleration*delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	move_direction = Vector2()

func _on_DetectionRadius_body_entered(body):
	if body.is_in_group("Player"):
		target = body
