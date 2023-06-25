extends RigidBody2D

@export var speed: int = 400

func _on_hitbox_body_entered(body):
	if (body.name != "TileMap"):
		body.health -= 1
		print("P HEALTH: ", body.health)
	queue_free()
