extends RigidBody2D

@export var speed: int = 400

func _on_hitbox_body_entered(body):
	print("removing bullet!")
	queue_free()
