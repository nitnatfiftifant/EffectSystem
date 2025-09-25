class_name EffectManager extends Node

func _ready() -> void:
	name = "EffectManager"

func get_effects():
	return get_children() as Array[Effect]

func add_effect(effect: Effect, targets:Array):
	# сделать целевым узлом родительский узел, выглядит не гибко
	#var target:Entiti = get_parent()
	#assert(get_parent() is Entiti, "Родительский узел: " + str(target) + " не является Entiti")
	#effect.targets.append(target)
	add_child(effect)
	effect.targets.append_array(targets)
	effect.name = effect.name_effect
	effect.start.connect(start_effect.bind(effect))
	effect.apply.connect(apply_effect.bind(effect))
	effect.end.connect(end_effect.bind(effect))

func remove_effect(effect: Effect):
	if get_effects().has(effect):
		get_children().erase(effect)
	else:
		pass
		#print("У менеджера и так нет этого эффекта, это странно")

func has_duplicate_effect(name_effect:String) -> bool:
	for i in get_effects():
		if i.name_effect == name_effect:
			return true
	return false

func start_effect(effect: Effect):
	#print("Добавлен эффект" + effect.name_effect)
	pass

func apply_effect(effect: Effect):
	#print("Применился эффект" + effect.name_effect)
	pass

func end_effect(effect: Effect):
	#print("Эффект " + effect.name_effect + " закончился")
	pass
