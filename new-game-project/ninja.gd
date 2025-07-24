extends CharacterBody2D
 

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@onready var sprite_2d = $Sprite2D
# Get the gravity from the project settings to be synced with Rigidbody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Animations
	if (velocity.x > 1 || velocity.x < -1 ):
		sprite_2d.animation = "des"
	else:
		sprite_2d.animation = "jump"
	pass
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "run"
		sprite_2d.animation = "des"
		sprite_2d.animation = "jump"
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction aand handle the movement/deceleration.
	# As good practic, you should replace UI actions with custom gameplay action
	var direction = Input.get_axis("ui_left","ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
