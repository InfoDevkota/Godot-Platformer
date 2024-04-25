extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var moving_left = false

@export var SPEED = 50;
@export var MAX_LEFT = 50;
@export var MAX_RIGHT = 60;

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	pass

func move(delta):
	if moving_left:
		animated_sprite_2d.position.x -= SPEED * delta
		if animated_sprite_2d.position.x < -1 * MAX_LEFT:
			animated_sprite_2d.position.x = -1 * MAX_LEFT
			moving_left = false
			animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.position.x += SPEED * delta
		if animated_sprite_2d.position.x > MAX_RIGHT:
			animated_sprite_2d.position.x = MAX_RIGHT
			moving_left = true
			animated_sprite_2d.flip_h = false
			
	pass
