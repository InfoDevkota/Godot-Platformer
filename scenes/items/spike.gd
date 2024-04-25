extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var direction = 1
	if body.global_position.x < global_position.x:
		direction = -1
	body.hit(direction)
	pass # Replace with function body.
