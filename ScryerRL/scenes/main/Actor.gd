extends Sprite
class_name Actor
var myName = "actor"
var stamina = 4
var staminaMax = stamina
var staminaRegen = 2
var staminaUsed = 0
var faction = GroupName.FACTION.ENEMY
var hp = 1
var hpMax = hp
var skills: Array
var intelligence = GroupName.INTELLIGENCE.SMART
var hashmap = []
var test = 0

var move = 0
var dodge = 0

var dice = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_skills()
	_init_die()
	print("skills length is " + str(len(skills)))
	print(skills[0])
func _init_die() -> void:
	for child in range(0, 10):
		dice.append(get_child(child) as die)

func _init_skills() -> void:
	var skillList = get_child(10)
	var skillListChildren = skillList.get_children()
	for skill in skillListChildren:
		skills.append(skill as Skill_Skill)
	
	
func start_turn() -> void:
	#exhaust all die
	for die in dice:
		die.set_exhausted(true)
	for x in stamina:
		dice[x].set_exhausted(false)
		dice[x].roll()


func fetch_skill() -> Skill_Skill:
	print("skill test")
	print(skills[0].skill_dmg)
	skills[0].skill_dmg+=1
	return skills[0]
	
func set_stamina() -> void:
	#stamina = max(currStamina + (min(stamRegen - stamUsed, 0), maxStamina)
	var regen = min(staminaRegen - staminaUsed, 0)
	stamina = max(stamina + regen, staminaMax)

func exhaust_dice(used_die: Array) -> void:
	for die in used_die:
		for x in range(0, dice.size()):
			if die == dice[x].value:
				dice[x].set_exhausted(true)
				break

func fetch_dice(return_exhaust: bool = false) -> Array:
	var die_list = []
	for die in dice:
		#return only not-exhaused dice unless return_exhaust == true
		if die.exhausted == false or die.exhausted == return_exhaust:
			die_list.append(die.value)
	return die_list

func where_am_I() -> Array:
	var source: Array = ConvertCoord.vector_to_array(position)
	return source

func add_hash(hash_to_add: String):
	if not hashmap.find(hash_to_add):
		hashmap.append(hash_to_add)

func remove_hash(hash_to_remove: String):
	if hashmap.find(hash_to_remove):
		hashmap.remove(hashmap.find(hash_to_remove))

func change_move(amount: int) -> void:
	move = max(move+amount, 0)
