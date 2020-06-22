extends Node

var actor_lib: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready():
	_init_actor_lib()
	
func _init_actor_lib() -> void:
	var dirPath = "res://scenes/sprites/actor/"
	var dir = Directory.new()
	dir.open(dirPath)
	dir.list_dir_begin()
	var file_name = dir.get_next()

	while(file_name!=""): 
		if dir.current_is_dir():
			pass
		else:
			print(dirPath+file_name)
			actor_lib[file_name.get_basename()] = load(dirPath+file_name) as PackedScene
		file_name = dir.get_next()
	print(actor_lib.keys())
	print("actors")
	print(actor_lib.values())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
