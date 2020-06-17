extends Node

var terrain_lib: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready():
	_init_terrain_lib()
	
func _init_terrain_lib() -> void:
	var dirPath = "res://scenes/sprites/terrain/"
	var dir = Directory.new()
	dir.open(dirPath)
	dir.list_dir_begin()
	var file_name = dir.get_next()

	while(file_name!=""): 
		if dir.current_is_dir():
			pass
		else:
			terrain_lib[file_name.get_basename()] = load(dirPath+"/"+file_name)
		file_name = dir.get_next()
	print(terrain_lib.keys())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
