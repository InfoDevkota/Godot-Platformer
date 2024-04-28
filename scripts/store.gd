extends Node

var current_data

func _ready():
	pass # Replace with function body.

# taken from godot 3.5
func json_file_exists(filename):
	if not FileAccess.open("user://"+ filename +".save", FileAccess.READ):
		return false
	return true

func read_json_file(filename):
	var file = FileAccess.open("user://"+ filename +".save", FileAccess.READ)
	var json_object = JSON.new()
	var parse_err = json_object.parse(file.get_as_text());
	var data = json_object.get_data()
	
	return data

func save_json_data(filename, data):
	var file = FileAccess.open("user://"+ filename +".save", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()
	


# add required functions to access and save
func get_data():
	if not json_file_exists('data'):
		save_data({
			"opencutSceneShow": false,
		})
		
	return read_json_file('data');

func save_data(data):
	current_data = data
	save_json_data('data', data)

func get_current_data():
	if not current_data:
		current_data = get_data()
	return current_data
