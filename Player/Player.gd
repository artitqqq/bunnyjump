extends KinematicBody2D

var motion = Vector2(0,100)
export var gravity = 30
export var SPEED = 1000
export var jump = 1000
var jump_count = 1


func _physics_process(delta):
	
	move_and_slide(motion, Vector2(0,-1))
	
	apply_gravity()
	walk()
	jump()

	
func walk():
	if Input.is_action_pressed("left") and not Input.is_action_just_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right")and not Input.is_action_just_pressed("left"):
		motion.x = +SPEED
	else:
		motion.x = 0

func jump():
	if jump_count < 1:
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump
			jump_count = jump_count + 1
	if is_on_floor():
		jump_count = 0

func apply_gravity():
	motion.y = motion.y + gravity
	
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity
