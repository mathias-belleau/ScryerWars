extends Node2D
class_name die

var value = 1
var exhausted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func set_exhausted(exhaust: bool) -> void:
	exhausted = exhaust

func roll() -> void:
	value = randi()%6+1
