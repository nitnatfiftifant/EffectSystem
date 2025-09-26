extends Effect

@export var damage:=1.0

@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D

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
			target.effect_mgr.add_effect(EffectsDb.id[EffectsDb.EffectID.FIRE_EXPLOSION], [target])
	super()
