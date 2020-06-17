extends Node2D

var _actor_list: Array

func _ready():
	randomize()
	pass # Replace with function body.

func do_turns_for_actors(faction: int) -> void:
	for actor in _actor_list:
		if actor.faction == faction:
			print("it's my turn! " + actor.myName)
			print("I work for " + str(actor.faction))

func create_actor_sprite(actor: PackedScene, groupName: String, x: int, y: int, faction) -> void:
	var new_sprite := actor.instance() as Actor
	new_sprite.position = ConvertCoord.index_to_vector(x, y)
	new_sprite.z_index = 1
	new_sprite.add_to_group(groupName)
	add_child(new_sprite)
	new_sprite.test = randi()%100
	new_sprite.faction = faction
	
	#duplicate for resource issue fix
	#new_sprite = new_sprite.duplicate()
	_actor_list.append(new_sprite)
	print("test: " + str(new_sprite.test))


func _on_BattleBoard_declare_phase():
	pass # Replace with function body.
