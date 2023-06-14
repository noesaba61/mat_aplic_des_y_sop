extends Node2D

export (PackedScene) var Gem 

var level = 0
var time_left =0
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	randomize()
	spawn_gems()
	time_left = 20
	$Labelgameover.visible = false
	
func _process(delta):
	if $GemContainer.get_child_count() == 0:
		level += 1
		spawn_gems()
		time_left +=5
	
	
	
func  spawn_gems():
	if Gem != null:
		for index in range (5 + level):
			var Gema = Gem.instance()
			Gema.position = Vector2 (rand_range(0, 480),rand_range(0,720))
			$GemContainer.add_child(Gema)



func _on_Timer_timeout():
	time_left -= 1
	$hud.update_timer(time_left)
	if time_left <= 0:
		game_over()
		
func game_over():
	$Timer.stop()
	$Labelgameover.visible = true
	$jugador.game_over()
		

func _on_jugador_picked():
	score += 1
	$hud.update_score(score)
