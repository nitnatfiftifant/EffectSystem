extends Area3D

var speed:=1.0

var durality:=1.0

var s_effect:PackedScene = preload("res://Effect/Effects/fire.tscn")

func _physics_process(delta: float) -> void:
	position.z -= speed * delta
	if durality > 0.0:
		durality -= delta
	else:
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	body = body as Entiti
	if not body:
		return
	
	var effect = s_effect.instantiate()
	effect.target = body
	body.effect_mgr.add_effect(effect)

func _on_body_exited(body: Node3D) -> void:
	queue_free()
