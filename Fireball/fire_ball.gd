extends Area3D

var speed:=1.0

var durality:=1.0

var s_effect:PackedScene = preload("res://Effect/effect.tscn")

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
	
	Game.add_effect(get_parent(), s_effect, body)
	print(body.name)

func _on_body_exited(body: Node3D) -> void:
	queue_free()
