extends Area3D

var targets:Array[Entiti]

func _ready() -> void:
	$GPUParticles3D.emitting = true

func _on_body_entered(body: Node3D) -> void:
	if body != get_parent():
		if body is Entiti:
			targets.append(body)

func _on_body_exited(body: Node3D) -> void:
	if targets.has(body):
		targets.erase(body)

func _on_gpu_particles_3d_finished() -> void:
	if targets.is_empty() == false:
		for i:Entiti in targets:
			var fire_effect:Effect = load("uid://c8csm0yiv8ai6").instantiate()
			if i.effect_mgr.has_duplicate_effect(fire_effect.name_effect):
				fire_effect.queue_free()
				continue
			i.effect_mgr.add_effect(fire_effect, [i])
	queue_free()
