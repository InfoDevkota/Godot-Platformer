extends ParallaxBackground

@export var auto_move = false

@onready var cloud = $Cloud
@onready var mountains = $mountains

const SPEED = -60;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if auto_move:
		move_bg(delta);
	pass

func move_bg(delta):
	cloud.motion_offset.x += SPEED * cloud.motion_scale.x * delta
	mountains.motion_offset.x += SPEED * mountains.motion_scale.x * delta
	pass
