extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.global_position.y < global_position.y: 
		animated_sprite_2d.play("lunch")
		body.high_jump()
	
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite_2d.animation == "lunch":
		animated_sprite_2d.play("default")
	pass # Replace with function body.
