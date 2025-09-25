extends Control

@onready var object_info_panel: PanelContainer = %ObjectInfoPanel
@onready var fps_label: Label = %FPSLabel

signal s_control_entiti

func _process(delta: float) -> void:
	fps_label.text = "FPS: " + str(Engine.get_frames_per_second())

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("LBM"):
			object_info_panel.hide()

func _on_control_entiti_button_pressed() -> void:
	if object_info_panel.target != null:
		s_control_entiti.emit(object_info_panel.target)
