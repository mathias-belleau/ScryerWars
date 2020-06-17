extends Resource
class_name Skill_Skill
var my_speed = Skills.SPEED.INSTANT
var skill_name = "skill"
var skill_description = "described skill"
var skill_cost = Skills.SKILLCOST.ONE
var skill_dmg = 0
var attack_type = Skills.ATTACKTYPE.SELF


#called on skill use
#for instant abilities will add their benefits now
func skill_action(source: PackedScene) -> void:
	
	print("testing")
	#if wanting to add resolve part call to 
	#get_tree().call_group(GroupName.BATTLEBOARD, "skill_used", self)
	print(skill_dmg)
#called on resolve of turn upon the tiles it is targeting
#if instant speed resolve instantly
func skill_resolve(tile: PackedScene, actor: PackedScene) -> void:
	print("you found me")
	pass
	
