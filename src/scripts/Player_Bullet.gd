extends Area2D

@export var speed = 750

func _physics_process(delta):
	if (position.x < 0 || position.y < 0 || position.x > get_viewport().size.x || position.y > get_viewport().size.y):
		print("Bullet Removed!")
		queue_free()
	position += transform.x * speed * delta
