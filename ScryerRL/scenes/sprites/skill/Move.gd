extends "res://scenes/sprites/skill/skill.gd"

func skill_action(actor) -> bool:
	actor.change_move(1)
	return true

func can_use(actor) -> Array:
	var dice = actor.fetch_dice()
	var result = Skills.check_any(dice, 1)
	return result
