extends KinematicBody2D

var motion = Vector2(0,100)
export var Gravity = 500
export var SPEED = 500


func _physics_process(delta):
	if Input.is_action_pressed("left") and not Input.is_action_just_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right")and not Input.is_action_just_pressed("left"):
		motion.x = +SPEED
	else:
		motion.x = 0

	if Input.is_action_pressed("jump"):
		motion.y = -Gravity
	else:
		motion.y = Gravity
		
	move_and_slide(motion)