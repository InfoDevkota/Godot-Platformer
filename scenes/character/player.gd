extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var is_hit = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
	if is_on_floor():
		if is_hit:
			is_hit = false;
			
		if velocity.x != 0:
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta
		if is_hit:
			animated_sprite_2d.play("hit")
		else:
			animated_sprite_2d.play("jump")
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if !is_hit:
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
			if direction -1:
				animated_sprite_2d.flip_h = true
			else:
				animated_sprite_2d.flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func high_jump():
	velocity.y = JUMP_VELOCITY * 2
	
func hit(direction):
	is_hit = true
	velocity.y = JUMP_VELOCITY
	velocity.x = direction * SPEED
	
	move_and_slide()
	
	pass

func coin_collected(number=1):
	print("coin collected")
	pass
