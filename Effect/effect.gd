class_name Effect extends Node
"""
Еффекты - узлы с уникальным функционалом. Они существуют в дереве узлов и применяют разные функции на свои цели
Эффект может иметь только одну цель или связку целей. Если цель удаляется, то эффект уже не нужен
"""

@export var name_effect:String="Effect" ## Индификатор
@export var duration:float = 5.0 ## Как долго будет существовать эффект
## Количество сбрабатывания эффекта на протяжении всей длительности
@export_range(1, 1_000_000) var ticks_per_duration: int = 5 : set = _set_ticks_per_duration
@export var oneshot:bool = false ## Если true, то эффект вызывается один раз при создании, применяет метод и удаляется
@export var passive:bool = false ## Если true, то эффект не будет удалён со временем 

# перменные для счётчика
var ticks_done: int = 0 # сколько тиков уже прошло
var tick_delay: float = 1.0
var tick_timer: float = 0.0

var target:Entiti

signal start
signal apply
signal end

var elapsed := 0.0 # просто проверка длительности

func _set_ticks_per_duration(value: int) -> void:
	ticks_per_duration = value
	tick_delay = duration / ticks_per_duration
	ticks_done = 0

func _ready() -> void:
	name = name_effect
	_start_effect()
	if oneshot:
		_finished()

func _physics_process(delta: float) -> void:
	elapsed += delta

func _process(delta: float) -> void:
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
	
	# устойчивое применение эффекта
	while tick_timer <= 0.0 and ticks_done < ticks_per_duration:
		_apply_effect()
		ticks_done += 1
		tick_timer += tick_delay

	if duration <= 0.0:
		_finished()

func _start_effect():
	start.emit()

func _finished():
	end.emit()
	queue_free()

func _apply_effect():
	if target:
		apply.emit()
	else:
		_finished()
