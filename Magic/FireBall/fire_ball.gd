extends Area3D

var speed:=1.0

var durality:=1.0

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
	
	body.effect_mgr.add_effect(EffectsDb.id[EffectsDb.EffectID.FIRE_EFFECT], [body])
	queue_free()
