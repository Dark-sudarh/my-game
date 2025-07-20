extends CharacterBody2D  # or KinematicBody2D in Godot 3.x

# Variables
var jump_velocity = -400
var gravity = 1000

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	# Jump when space is pressed and on the floor
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Move the character
	velocity = move_and_slide(velocity, Vector2.UP) 
