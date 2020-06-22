extends Node2D

const PathFinder := preload("res://scenes/main/PathFinder.gd")
var _ref_PathFinder: PathFinder

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func do_turn(actor: Actor) -> void:
	print("at start of turn")
	print(actor.move)
	print(actor.skills.size())
	print("dice avail")
	print(actor.fetch_dice())
	#need to loop through each actors skills twice or until 2 actions done
	for skill in actor.skills:
		var skill_can_use = skill.can_use(actor)
		if skill_can_use.size() >= 1:
			var sucess_skill_use = skill.skill_action(actor)
			if sucess_skill_use:
				#we used the skill so need to exhaust dice and end turn
				actor.exhaust_dice(skill_can_use)
	print("at end of turn")
	print(actor.move)
	print("dice avail")
	print(actor.fetch_dice())
	
	
