extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("PathFinder")._ref_DungeonBoard = get_node("DungeonBoard")
	get_node("PathFinder")._ref_ActorHandler = get_node("ActorHandler")
	get_node("AIHandler")._ref_PathFinder = get_node("PathFinder")
