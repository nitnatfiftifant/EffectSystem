extends PanelContainer

@onready var object_name: Label = %ObjectName
@onready var effect_container: GridContainer = %EffectContainer
@onready var object_parameters_container_1: VBoxContainer = $VBoxContainer/EffectsOnObject2/ScrollContainer/HSplitContainer/ObjectParametersContainer1
@onready var object_parameters_container_2: VBoxContainer = $VBoxContainer/EffectsOnObject2/ScrollContainer/HSplitContainer/ObjectParametersContainer2

var target = null

func _ready() -> void:
	close()

func _process(delta: float) -> void:
	if target == null:
		close()
	if visible == true:
		update()

func open(_target:Entiti):
	show()
	target = _target
	update()

func close():
	hide()
	clear()

func update():
	clear()
	update_parametrs(target)
	update_effects(target)

func update_parametrs(target:Entiti):
	var name_target:String = target.attributes.Name
	object_name.text = name_target
	var attributes:=target.attributes
	for i in attributes:
		var label:Label = Label.new()
		label.text = str(i) + ": " + str(attributes[i])
		if object_parameters_container_1.get_child_count() > 5:
			if object_parameters_container_2.get_child_count() > 5:
				print("Аттрибутов слишком много")
				continue
			object_parameters_container_2.add_child(label)
		else:
			object_parameters_container_1.add_child(label)

func update_effects(target:Entiti):
	$VBoxContainer/EffectsOnObject.title = "Колличество эффектов: " + str(target.effect_mgr.get_effects().size())
	for i:Effect in target.effect_mgr.get_effects():
		var label:Label = Label.new()
		label.text = i.name
		effect_container.add_child(label)

func clear():
	object_name.text = ""
	for i in object_parameters_container_1.get_children():
		i.queue_free()
	for i in object_parameters_container_2.get_children():
		i.queue_free()
	for i in effect_container.get_children():
		i.queue_free()
