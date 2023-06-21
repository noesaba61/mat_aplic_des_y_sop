extends Node2D

var score = 0


func _on_moneda_picked():
	score += 1
	$HUD.update_score(score)


func _on_moneda2_picked():
	score += 1
	$HUD.update_score(score)
