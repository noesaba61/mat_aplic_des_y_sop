extends Node2D

var score  = 0

export(PackedScene) var Coin

func _ready():
	$tileiten.hide()
	spawn_coins()
	$HUD/labelGameOver.visible = false
	
func spawn_coins():
	for cell in $tileiten.get_used_cells():
		var moneda = Coin.instance()
		moneda.position = $tileiten.map_to_world(cell)*1.5\
							+ $tileiten.cell_size /2
		add_child(moneda)


func _on_GameOver_body_entered(body):
	$HUD/labelGameOver.visible = true
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Main/main.tscn")

	#get_tree().change_scene()
	
