class_name InputHandler extends Node

@export var input_settings:InputSettings

@export var target:Entiti

func _ready() -> void:
	for action_name in input_settings.inputs:
		var keycode: String = input_settings.inputs[action_name]

		var ev := InputEventKey.new()
		ev.physical_keycode = OS.find_keycode_from_string(keycode)

		if not InputMap.has_action(action_name):
			InputMap.add_action(action_name)
		
		InputMap.action_add_event(action_name, ev)

func _process(delta: float) -> void:
	if target:
		if target.has_method("move"):
			target.move("null")
			if Input.is_action_pressed("move_forward"):
				target.move("forward")
			if Input.is_action_pressed("move_back"):
				target.move("back")
			if Input.is_action_pressed("move_left"):
				target.move("left")
			if Input.is_action_pressed("move_right"):
				target.move("right")
