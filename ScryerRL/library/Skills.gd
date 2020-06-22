extends Node

enum SPEED {INSTANT, FAST, SLOW}
enum SKILLCOST {ONE,TWO,THREE,DOUBLE,TRIPLE,STRAIGHT3,STRAIGHT4,STRAIGHT5}
enum ATTACKTYPE {SELF,MELEE,BOLT, PROJECTILE,SMITE,BREATH}

var SkillList: Dictionary


func _ready() -> void:
	SkillList = {}
	var check = check_matches([1,2,3,3,3,4,4,4], 2)
	print("checking dice checker")
	print(check)
	check = check_matches([3,1,2,3,4,1,1], 3)
	print("checking dice checker")
	print(check)
	
	var test = sort_dice([1,2,3,6,3,3,4,4,1])
	print("pete method test")
	print(test)
	
	test = check_any([4,5,1,2,3,4], 3)
	print('check an test')
	print(test)

func _init_skill_list() -> void:
	var dirPath = "res://library/skill/"
	var dir = Directory.new()
	dir.open(dirPath)
	dir.list_dir_begin()
	var file_name = dir.get_next()

	while(file_name!=""): 
		if dir.current_is_dir():
			pass
		else:
			var skill_name = file_name.get_basename()
			var skill_loaded = load(dirPath+"/"+file_name)	
			print(skill_loaded.skill_name)
			SkillList[skill_name] = skill_loaded
		file_name = dir.get_next()
	print(SkillList.keys())

func sort_dice(dice) -> Dictionary:
	var sorted: Dictionary = {}
	for x in range(1,7):
		sorted[x] = 0
		
	for die in dice:
		sorted[die] += 1
	return sorted

#the check functions check if it's usable with passed dice. if yes
#it creates an array of dice used to exhaust for the unit

func check_any(dice, num) -> Array:
	dice = sort_dice(dice)
	var used = []
	var found = 0
	for x in range(1,7):
		if dice[x] >= 1:
			found += 1
			used.append(x)
			if used.size() >= num:
				break
	return used

func check_matches(dice, num) -> Array:
	dice = sort_dice(dice)
	var used = []
	var found = 0
	for x in range (1,7):
		if dice[x] >= num:
			found = x
			break
	if not found == 0:
		for x in range(0,num):
			used.append(found)
	
	return used
