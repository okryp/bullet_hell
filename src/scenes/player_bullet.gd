extends RigidBody2D

@export var speed: int = 400


func _on_hitbox_body_entered(body):
	if (body.name != "TileMap"):
		body.health -= 1
	
	# print("removing bullet!")
	queue_free()
	pass # Replace with function body.
