extends Sprite
class_name Actor
var myName = "actor"
var stamina = 4
var staminaMax = stamina
var stamRegen = 2
var stamUsed = 0
var faction = GroupName.FACTION.ENEMY
var hp = 1
var hpMax = hp
export(Array, Resource) var skills : Array = []
var intelligence = GroupName.INTELLIGENCE.SMART
var hashmap = []
var test = 0

var move = 0
var dodge = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	print("skills length is " + str(len(skills)))
	print(skills[0])
	_init_skills()

func _init_skills() -> void:
	#need to dupilicate skill resources so they dont override
	for x in len(skills):
		#var new_skill = skills[x].duplicate()
		#skills[x] = new_skill
		pass

func fetch_skill() -> Skill_Skill:
	print("skill test")
	print(skills[0].skill_dmg)
	skills[0].skill_dmg+=1
	return skills[0]
	

func where_am_I() -> Array:
	var source: Array = ConvertCoord.vector_to_array(position)
	return source

func add_hash(hash_to_add: String):
	if not hashmap.find(hash_to_add):
		hashmap.append(hash_to_add)

func remove_hash(hash_to_remove: String):
	if hashmap.find(hash_to_remove):
		hashmap.remove(hashmap.find(hash_to_remove))
