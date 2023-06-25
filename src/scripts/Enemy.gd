extends RigidBody2D

@export var bullet_scene : PackedScene
@export var health : int

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.position = $Muzzle.global_position
	bullet.rotation = get_angle_to($Muzzle.global_position)
	get_parent().add_child(bullet)
	bullet.apply_central_impulse(Vector2(bullet.speed, 0).rotated(rotation))
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
