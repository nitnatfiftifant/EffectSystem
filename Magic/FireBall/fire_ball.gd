extends Area3D

var speed:=1.0

var durality:=1.0

var s_fire:PackedScene = preload("uid://c8csm0yiv8ai6")

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
	
	var effect = s_fire.instantiate()
	if body.effect_mgr.has_duplicate_effect(effect.name_effect) == false:
		body.effect_mgr.add_effect(effect, [body])
	else:
		effect.queue_free()
	queue_free()
