extends Sprite
class_name Terrain
var myName = "floor"
var walkable = true

var skills_to_resolve = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_skill(skill) -> void:
	pass

func remove_skill(skill) -> void:   
	pass
	
func get_name():
	return myName

func walk_onto_hazard(actor: PackedScene) -> void:
	pass
