class_name Game extends Node

@export var input_handler:InputHandler
@export var debug_console: Control
@export var entities: Node

var scene_fireball:PackedScene = preload("uid://day8n0peqjall")

func _ready() -> void:
	debug_console.s_control_entiti.connect(change_current_control_entiti)
	for i:Entiti in entities.get_children():
		i.mouse_select.connect(debug_console.object_info_panel.open.bind(i))

func _process(delta: float) -> void:
	#create_fire_ball()
	if Input.is_action_just_pressed("ui_accept"):
		create_fire_ball()

func create_fire_ball():
	var fireball = scene_fireball.instantiate()
	add_child(fireball)
	fireball.speed = 10

func change_current_control_entiti(target: Entiti):
	input_handler.target = target
