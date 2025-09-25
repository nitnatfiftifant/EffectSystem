class_name Effect extends Node
"""
Еффекты - узлы с уникальным функционалом. Они существуют в дереве узлов и применяют разные функции на свои цели
Эффект может иметь только одну цель или связку целей. Если цель удаляется, то эффект уже не нужен
"""

## Нужен для индификации
@export var name_effect:String="Effect"
## Как долго будет существовать эффект
@export var duration:float = 5.0
## Как часто вызывается метод
@export var tick_delay: float = 1.0
## Если true, то эффект вызывается один раз при создании, применяет метод и удаляется
@export var oneshot:bool = false
## Если true, то эффект не будет удалён со временем 
@export var passive:bool = false

var tick_timer: float = 0.0

var target:Node

signal start
signal apply
signal end

func _ready() -> void:
	name = name_effect
	target.appling_effects.append(self)
	start.emit()
	if oneshot:
		_apply_effect()
		_finished()

func _process(delta: float) -> void:
	if oneshot == false:
		life_cycle(delta)

func life_cycle(delta):
	if passive and duration < 0:
		# бесконечный пассивный эффект
		tick_timer -= delta
		if tick_timer <= 0.0:
			_apply_effect()
			tick_timer = tick_delay

	# обычные временные эффекты
	duration -= delta
	tick_timer -= delta
	if tick_timer <= 0.0:
		_apply_effect()
		tick_timer = tick_delay

	if duration <= 0.0:
		_finished()

func _finished():
	print(name_effect + " закончился")
	target.appling_effects.erase(self)
	end.emit()
	queue_free()

func _apply_effect():
	if target:
		print(name_effect + " применился на " + target.name)
		apply.emit()
	else:
		print("Нет цели")
		_finished()
