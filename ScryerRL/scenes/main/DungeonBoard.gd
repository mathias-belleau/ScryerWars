extends Node2D

var _terrain_dict: Dictionary #[groupName][x,y] =

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_terrain_dict()
	
	
func _init_terrain_dict() -> void:
	for x in range(DungeonSize.MAX_X):
		_terrain_dict[x] = []
		_terrain_dict[x].resize(DungeonSize.MAX_Y)

func _on_BattleBoard_create_tile(tile: PackedScene, groupName: String, x: int, y: int, z: int) -> void:
	var new_sprite := tile.instance() as Terrain
	new_sprite.position = ConvertCoord.index_to_vector(x, y)
	new_sprite.z_index = 0
	new_sprite.add_to_group(groupName)
	add_child(new_sprite)
	
	#duplicate for resource issue fix
	_terrain_dict[x][y] = new_sprite.duplicate() as Terrain
