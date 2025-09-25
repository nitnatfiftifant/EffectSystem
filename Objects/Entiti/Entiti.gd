class_name Entiti extends CharacterBody3D

@export var attributes:Dictionary = {"Name": "Entity", "HP": 100, "Speed": 10.0}

@onready var hp_label: Label3D = %HPLabel
@onready var effects_label: Label3D = %EffectsLabel

var hp:=100 : set = take_damage

var effect_mgr:EffectManager

signal mouse_select

var direction:Vector3 = Vector3.ZERO

var speed:float = 0.0

func _ready() -> void:
	effect_mgr = EffectManager.new()
	add_child(effect_mgr)
	input_event.connect(_on_input_event)
	hp = -attributes.HP
	print(hp)
	update_info()
	speed = attributes.get("Speed")

func _process(delta: float) -> void:
	hp_label.text = str(hp)
	update_info()

func take_damage(damage):
	attributes.HP -= damage
	hp = attributes.HP
	if hp <= 0:
		queue_free()

func update_info():
	var lines: Array[String] = []
	for i: Effect in effect_mgr.get_effects():
		var line:String = i.name_effect + " :" + "%0.2f" % i.duration
		lines.append(line)
	
	# объединяем строки через перенос строки
	effects_label.text = "Эффекты" + "\n" + "\n".join(lines)

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func move(_direction:String):
	match _direction:
		"forward":
			direction.z -= 1
		"back":
			direction.z += 1
		"left":
			direction.x -= 1
		"right":
			direction.x += 1
		_:
			direction = Vector3.ZERO
	direction = direction.normalized()

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("LBM"):
			mouse_select.emit()
			print('mouse')
