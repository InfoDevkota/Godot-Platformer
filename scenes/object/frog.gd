extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func jump_completed():
	animated_sprite_2d.play("idle")

func _on_body_entered(body):
	var flip = false
	var direction = -1
	
	if body.global_position.x < global_position.x:
		flip = true
		direction = 1
	
	animated_sprite_2d.flip_h = flip
	animated_sprite_2d.play("jump")
	
	var tween = get_tree().create_tween()
	
	var init_position = position;
	var half_final = init_position + Vector2(direction * 60, -40)
	var final = half_final + Vector2(direction * 60, 40)
	
	tween.tween_property(self, "position", half_final, .25)
	tween.tween_property(self, "position", final, .25)
	tween.tween_callback(jump_completed)
	pass # Replace with function body.
