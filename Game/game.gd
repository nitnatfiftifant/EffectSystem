class_name Game extends Node

var scene_fireball:PackedScene = preload("res://Fireball/fire_ball.tscn")
@onready var debug_console: Control = $DebugConsole
@onready var entities: Node = $Entities

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i:Entiti in entities.get_children():
		i.mouse_select.connect(debug_console.object_info_panel.open.bind(i))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	create_fire_ball()
	if Input.is_action_just_pressed("ui_accept"):
		create_fire_ball()

func create_fire_ball():
	var fireball = scene_fireball.instantiate()
	add_child(fireball)
	fireball.speed = 10
