extends Control

@onready var object_info_panel: PanelContainer = $ObjectInfoPanel
@onready var fps_label: Label = $FPSLabel

func _process(delta: float) -> void:
	fps_label.text = str(Engine.get_frames_per_second())

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("LBM"):
			object_info_panel.hide()
