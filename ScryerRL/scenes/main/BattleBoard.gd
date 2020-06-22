extends Node2D

# Called when the node enters the scene tree for the first time.

signal start_player_turn
signal create_tile
signal create_actor
signal declare_phase

func _ready():
	add_to_group(GroupName.BATTLEBOARD)
	
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(InputName.STARTGAME) and TurnSeq.currentPhase == 0:
	#gen dungeon and default starting units
		_init_create_dungeon()
		_init_create_actors()
		
	#make units	
		set_process_unhandled_input(false)
		TurnSeq.currentPhase=1
		_next_phase()

func _init_create_dungeon() -> void:
	for i in range(DungeonSize.MAX_X):
		for j in range(DungeonSize.MAX_Y):
			emit_signal("create_tile", TerrainLib.terrain_lib["FLOOR"], GroupName.TERRAIN,i, j, 0)
	pass

func _init_create_actors() -> void:
	print("actor lib")
	print(ActorLib.actor_lib.keys())
	var test = ActorLib.actor_lib["Actor"]
	print(test)
	print("ahh")
	emit_signal("create_actor" ,ActorLib.actor_lib["Actor"], GroupName.ACTOR, 3,4, GroupName.FACTION.ALLY)	
	emit_signal("create_actor" ,ActorLib.actor_lib["Actor"], GroupName.ACTOR, 3,5, GroupName.FACTION.ENEMY)	

func skill_used(skill) -> void:
	print(skill.skill_dmg)

func _next_phase() -> void:
	#cycle through each phase calling the proper function
	pass
	match TurnSeq.currentPhase:
		#enemy phase
		TurnSeq.TURNPHASE.ENEMYDECLARE:
			emit_signal("declare_phase", GroupName.FACTION.ENEMY)
			emit_signal("declare_phase", GroupName.FACTION.ALLY)
			##cycle through each enemy doing their actions
			TurnSeq.currentPhase +=1
		#player resolve phase
		TurnSeq.TURNPHASE.PLAYERRESOLVE:
			##cycle through all dungeon tiles resolving skills with faction ally
			TurnSeq.currentPhase +=1
		#player move phase.
		TurnSeq.TURNPHASE.PLAYERDECLARE:
			##move player allys
			##allow players turn to begin
			pass
		#enemy resolve phase
		TurnSeq.TURNPHASE.ENEMYRESOLVE:
			##cycle through all dungeon tiles resolving skills with faction enemy
			#goto enemy phase
			TurnSeq.currentPhase = 1
	
	
	
	
	
