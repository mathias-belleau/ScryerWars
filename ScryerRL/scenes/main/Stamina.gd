extends Node2D

var staminaDie = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_child(0).get_children():
		staminaDie.append(child)
	print(len(staminaDie))
	
func start_player_turn() -> void:
	pass	

func _unhandled_input(event: InputEvent) -> void:
	if not TurnSeq.currentPhase == 2:
		return
	if event.is_action_pressed(InputName.DIE_1):
		var stamDie = staminaDie[0]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_2):
		var stamDie = staminaDie[1]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_3):
		var stamDie = staminaDie[2]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_4):
		var stamDie = staminaDie[3]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_5):
		var stamDie = staminaDie[4]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_6):
		var stamDie = staminaDie[5]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_7):
		var stamDie = staminaDie[6]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_8):
		var stamDie = staminaDie[7]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.DIE_9):
		var stamDie = staminaDie[8]
		stamDie.update_selected()
	elif event.is_action_pressed(InputName.EXHAUST):
		exhaust_selected()
		
func exhaust_selected() -> void:
	#exhaust each selected die and unslect them
	var selected = []
	for die in staminaDie:
		if die.selected:
			selected.append(die)
			die.update_selected()
	for die in selected:
		die.update_exhaust()	
