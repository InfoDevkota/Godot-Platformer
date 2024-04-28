extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var data = Store.get_data()
	
	if data.opencutSceneShow:
		get_tree().change_scene_to_file("res://scenes/screen/main_menu.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/cutscenes/opening_cut_scene.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
