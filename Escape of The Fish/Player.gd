extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	# Add the gravity.
	var vel= Vector2()
	# Handle jump.
	if Input.is_action_pressed("down"):
		vel.y= +100
	if Input.is_action_pressed("up"):
		vel.y= -100
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	vel = vel.normalized()

	var direction = Input.get_vector("left", "right","up", "down")
	velocity = direction* SPEED
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	move_and_slide()
