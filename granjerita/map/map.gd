extends Node2D


var score  = 0

export(PackedScene) var coin

func _ready():
	$Tileitem.hide()
	spawn_coins()
	$HUD/Labelgameover.visible = false
	
func spawn_coins():
	for cell in $Tileitem.get_used_cells():
		var moneda = coin.instance()
		moneda.position = $Tileitem.map_to_world(cell)*1.5\
							+ $Tileitem.cell_size /2
		add_child(moneda) 	

func _on_gameover_body_entered(body):
	$HUD/Labelgameover.visible = true
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://main/main.tscn")
