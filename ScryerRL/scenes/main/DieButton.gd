extends TextureRect

var die1 = preload("res://resources/tileset/die1.tres")
var die2 = preload("res://resources/tileset/die2.tres")
var die3 = preload("res://resources/tileset/die3.tres")
var die4 = preload("res://resources/tileset/die4.tres")
var die5 = preload("res://resources/tileset/die5.tres")
var die6 = preload("res://resources/tileset/die6.tres")

var value = 1
var exhausted = false
var selected = false

func _ready():
	randomize()
	set_value(randi()%6+1)
	
func set_value(val: int) -> void:
	value = val
	match value:
		1:
			texture = die1
		2:
			texture = die2
		3:
			texture = die3
		4:
			texture = die4
		5:
			texture = die5
		6:
			texture = die6
			
func update_selected() -> void:
	if exhausted:
		return
	if selected:
		modulate = Color(1,1,1,1)
		selected = false
	else:
		modulate = Color(1,1,.4,1)
		selected = true
		
func update_exhaust() -> void:
	if exhausted:
		modulate = Color(1,1,1,1)
		exhausted = false
	else:
		exhausted = true
		modulate = Color(1,1,1,.4)
