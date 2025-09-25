extends Effect

@export var damage:=1.0

@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D

var s_fire_explosion_effect: PackedScene = preload("uid://17ottup8qmf1")

func _start_effect():
	super()

func _apply_effect():
	for target in targets:
		if target.has_method("take_damage"):
			target.take_damage(damage)
	super()

func _finished():
	for target in targets:
		if target:
			var explosion_effect:Effect = s_fire_explosion_effect.instantiate()
			if target.effect_mgr.has_duplicate_effect(explosion_effect.name_effect):
				explosion_effect.queue_free()
				continue
			target.effect_mgr.add_effect(explosion_effect, [target])
	super()
