extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# for dev
	#$AnimationPlayer.play("start")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_the_animation():
	$AnimationPlayer.play("start")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "start":
		get_tree().change_scene_to_file("res://scenes/levels/level_0.tscn")
	pass # Replace with function body.

func set_cutscene_as_shown():
	var data = Store.get_current_data()
	data.opencutSceneShow = true;
	Store.save_data(data)
