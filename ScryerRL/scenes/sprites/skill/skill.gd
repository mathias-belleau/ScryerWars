extends Node
class_name Skill_Skill
var my_speed = Skills.SPEED.INSTANT
var skill_name = "skill"
var skill_description = "described skill"
var skill_cost = Skills.SKILLCOST.ONE
var skill_dmg = 0
var attack_type = Skills.ATTACKTYPE.SELF


#called on skill use
#for instant abilities will add their benefits now
func skill_action(actor) -> bool:
	#find target method if needed?
	print("testing")
	#if wanting to add resolve part call to 
	#get_tree().call_group(GroupName.BATTLEBOARD, "skill_used", self)
	print(skill_dmg)
	return true
	
#called on resolve of turn upon the tiles it is targeting
#if instant speed resolve instantly
func skill_resolve(tile, actor) -> void:
	#current tile we are on
	#actor who cast this
	print("you found me")
	pass

func can_use(actor) -> Array:
	var die = actor.fetch_dice()
	return [false]
