extends Effect

@export var damage:=50.0

const FIRE_EXPLOSION = preload("uid://dxtjxh5od82mm")

var s_effect: PackedScene = preload("uid://c8csm0yiv8ai6")

func _start_effect():
	super()

func _apply_effect():
	for target in targets:
		if target.has_method("take_damage"):
			target.take_damage(damage)
	super()

func _finished():
	var explosion = FIRE_EXPLOSION.instantiate()
	targets[0].add_child(explosion)
	super()
