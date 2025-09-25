class_name Game extends Node

var scene_fireball:PackedScene = preload("res://Fireball/fire_ball.tscn")

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#for i in 5:
		#var effect = Effect.new()
		#add_child(effect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		create_fire_ball()

func create_fire_ball():
	var fireball = scene_fireball.instantiate()
	add_child(fireball)
	fireball.speed = 10

static func add_effect(world, s_effect:PackedScene, target:Node):
	var effect = s_effect.instantiate()
	effect.target = target
	world.add_child(effect)
