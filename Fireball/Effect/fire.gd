extends Effect

@export var damage:=1.0

@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D

func _start_effect():
	super()

func _apply_effect():
	if target.has_method("take_damage"):
		target.take_damage(damage)
	super()

func _finished():
	super()
