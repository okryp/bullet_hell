extends CharacterBody2D

@export var speed : int = 400
@export var bullet_scene : PackedScene
@export var health : int

func start(pos):
	position = pos

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.position = $Muzzle.global_position
	bullet.rotation = get_angle_to($Muzzle.global_position)
	get_parent().add_child(bullet)
	bullet.apply_central_impulse(Vector2(bullet.speed, 0).rotated(rotation))
	
func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	# Movement
	var movement_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	);
	if Input.get_action_strength("slow"):
		velocity = movement_direction * speed / 2
	else:
		velocity = movement_direction * speed
	
	# Shooting
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	move_and_slide()
	
