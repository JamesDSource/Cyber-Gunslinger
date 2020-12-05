extends KinematicBody2D

const GRAVITY = 10
const SPEED = 200
const JUMP = -300

onready var bullet = load("res://Player/PlayerBullet.tscn")
var bullets = 2
var bullets_remaining = bullets
var can_shoot = true

var animation = "Idle"
var animationSet = ""

var motion = Vector2()

var hp_max = 8
var hp = hp_max

func damage(hp_damage):
	hp = max(hp - hp_damage, 0)

func _ready():
	add_to_group("Player")

func _process(delta):
	if animation != animationSet:
		$AnimationPlayer.play(animation)
		animationSet = animation
	
	var gun_angle = rad2deg($Sprite/GunPosition.global_position.angle_to_point(get_global_mouse_position())) + 180
	$Sprite/GunPosition.scale.y = -1 if gun_angle > 90 && gun_angle < 270 else 1
	$Sprite/GunPosition.scale.y *= $Sprite.scale.x
	$Sprite/GunPosition.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("Shoot") && can_shoot && bullets_remaining > 0:
		$Sprite/GunPosition/AnimationPlayer.play("Shoot")
		
		var bullet_instance = bullet.instance()
		bullet_instance.direction = $Sprite/GunPosition/ShootPosition.global_position.direction_to(get_global_mouse_position())
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = $Sprite/GunPosition/ShootPosition.global_position
		
		$Sprite/GunPosition/ShootPosition/AudioStreamPlayer2D.play()
		
		bullets_remaining -= 1
		if bullets_remaining == 0:
			$ReloadTimer.start()
		
		can_shoot = false
		$ShootTimer.start()

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


func _on_ShootTimer_timeout():
	can_shoot = true


func _on_ReloadTimer_timeout():
	bullets_remaining = bullets
