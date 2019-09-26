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
	
	update_animation()
	
func die():
	if position.y > 1000:
		return true
	return false
	
func update_animation():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x >0 and is_on_floor():
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif motion.x <0 and is_on_floor():
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
	
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
			$AudioStreamPlayer.play()
	if is_on_floor():
		jump_count = 0

func apply_gravity():
	motion.y = motion.y + gravity
	
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + gravity