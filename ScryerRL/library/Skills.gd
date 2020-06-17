extends Node

enum SPEED {INSTANT, FAST, SLOW}
enum SKILLCOST {ONE,TWO,THREE,DOUBLE,TRIPLE,STRAIGHT3,STRAIGHT4,STRAIGHT5}
enum ATTACKTYPE {SELF,MELEE,BOLT, PROJECTILE,SMITE,BREATH}

var SkillList: Dictionary


func _ready() -> void:
	SkillList = {}

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
