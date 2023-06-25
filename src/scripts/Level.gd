extends Node
  
var bullet_timer : int = 0
var movement_switch_timer : int = 180
var progress = 0.001

var bosshealth_string = "BOSS HEALTH: %s"
var playerhealth_sting = "PLAYER HELTH: %s"

func game_over():
	print("GAME OVER\n", $Enemy.health, "\t:\t", $Player.health)
	$CanvasLayer/Message.visible = true
	pass

func new_game():
	$Player.start($PlayerSpawn.position)
	$Enemy.start($Path2D/PathFollow2D.position)
	
	$Enemy.rotate(deg_to_rad(90))
	$CanvasLayer/Message.visible = false

func enemy_shoot():
	bullet_timer += 1
	if (bullet_timer == 24):
		$Enemy.shoot()
		bullet_timer = 0

func randomize_movement():
	movement_switch_timer -= 1
	if movement_switch_timer == 0:
		var rand = randf_range(0, 1)
		movement_switch_timer = 180
		if rand > 0.5:
			progress = 0.001
			return progress
		else:
			progress = -0.001
			return progress

func _ready():
	new_game()

func _process(delta):
	if (get_node("Enemy") and get_node("Player")):
		$Enemy.look_at($Player.global_position)
		$Path2D/PathFollow2D.progress_ratio += progress
		$Enemy.position = $Path2D/PathFollow2D.position
		$CanvasLayer/BossHealth.text = bosshealth_string % $Enemy.health
		$CanvasLayer/PlayerHealth.text = playerhealth_sting % $Player.health
		
		randomize_movement()
		enemy_shoot()
		
		if $Enemy.health == 0:
			game_over()
			$Enemy.queue_free()
			$CanvasLayer/Message.text = "VICTORY"
		
		if $Player.health == 0:
			game_over()
			$Player.queue_free()
			$CanvasLayer/Message.text = "DEFEAT"
