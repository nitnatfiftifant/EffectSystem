extends Node

enum EffectID {FIRE_EFFECT, FIRE_EXPLOSION}

var path_effects: Dictionary = {
	EffectID.FIRE_EFFECT : "uid://c8csm0yiv8ai6",
	EffectID.FIRE_EXPLOSION : "uid://17ottup8qmf1"
}

func get_effect(id: int) -> String:
	return path_effects.get(id)
