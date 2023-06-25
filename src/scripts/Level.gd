extends Node
  
var timer : int = 0

func game_over():
	print("GAME OVER\n", $Enemy.health, "\t:\t", $Player.health)
	$CanvasLayer/Message.visible = true
	pass

func new_game():
	$Player.start($PlayerSpawn.position)
	$Enemy.start($EnemySpawn.position)
	
	$Enemy.rotate(deg_to_rad(90))
	$CanvasLayer/Message.visible = false
	
func _ready():
	new_game()
	$BossShotTimer.start()

func _process(delta):
	$Enemy.look_at($Player.global_position)
	
	timer += 1
	if (timer == 24):
		$Enemy.shoot()
		timer = 0;
		
	
	if $Enemy.health == 0:
		game_over()
		$CanvasLayer/Message.text = "VICTORY"
		
	if $Player.health == 0:
		game_over()
		$CanvasLayer/Message.text = "DEFEAT"
