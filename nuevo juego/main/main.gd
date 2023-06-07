extends Node2D

export (PackedScene) var Gem 
var level = 0 


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	randomize()
	spawn_gems()
 
func _process(delta):
	if $GemContainer.get_child_count() == 0:
		level += 1
		spawn_gems()
	
	
	
func  spawn_gems():
	if Gem != null:
		for index in range (5 + level):
			var Gema = Gem.instance()
			Gema.position = Vector2 (rand_range(0, 480),rand_range(0,720))
			$GemContainer.add_child(Gema)
