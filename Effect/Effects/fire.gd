extends Effect

@export var damage:=1.0

func _start_effect():
	print("Начинаем ебать")
	super()

func _apply_effect():
	if target.has_method("take_damage"):
		print("Ёбнул на %d" % damage)
		target.take_damage(damage)
	super()

func _finished():
	print("Хватит с него")
	super()
