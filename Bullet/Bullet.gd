extends KinematicBody2D

export(Array, String, "Player", "Enemies") var exception_groups = []
var direction = Vector2(1, 1)
export var speed = 20
export var damage = 1

var spark = load("res://Bullet/Hit Spark/HitSpark.tscn")

func _physics_process(delta):
	move_and_collide(direction * speed, false)

func _process(delta):
	var rotation_angle = rad2deg(direction.angle())
	rotation_degrees = rotation_angle

func _on_Hitbox_body_entered(body):
	var is_exception = false
	for group in exception_groups:
		if body.is_in_group(group): # damage
			is_exception = true
	if !is_exception:
		if body.has_method("damage"): body.damage(damage)
		var spark_instance = spark.instance()
		get_tree().root.add_child(spark_instance)
		spark_instance.global_position = global_position
		queue_free()
