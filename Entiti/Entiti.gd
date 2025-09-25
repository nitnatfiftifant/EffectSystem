class_name Entiti extends Node3D

@onready var effects_label: Label3D = $Label3D/EffectsLabel
var appling_effects:Array[Effect]
var effect_in_label:Array[Effect]

func _process(delta: float) -> void:
	if effect_in_label.is_empty():
		effects_label.text = ""
	for i in appling_effects:
		print(i)
		update_info(i)
	var remove = []
	for i in effect_in_label:
		if appling_effects.has(i) == false:
			remove.append(i)
	for i in remove:
		effect_in_label.erase(i)
	remove.clear()

func update_info(effect: Effect):
	if effect_in_label.has(effect):
		return
	else:
		if effect_in_label.size() == 1:
			effects_label.text = effect.name_effect
		else:
			effects_label.text = effects_label.text + ", " + effect.name_effect
		effect_in_label.append(effect)
