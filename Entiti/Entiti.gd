class_name Entiti extends Node3D

@onready var hp_label: Label3D = %HPLabel
@onready var effects_label: Label3D = %EffectsLabel

var hp:=2_00 : set = take_damage

var effect_mgr:EffectManager

func _ready() -> void:
	effect_mgr = EffectManager.new()
	add_child(effect_mgr)

func _process(delta: float) -> void:
	hp_label.text = str(hp)
	update_info()

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func update_info():
	var lines: Array[String] = []
	for i: Effect in effect_mgr.get_effects():
		var line:String = i.name_effect + " :" + "%0.2f" % i.duration
		lines.append(line)
	
	# объединяем строки через перенос строки
	effects_label.text = "Эффекты" + "\n" + "\n".join(lines)
