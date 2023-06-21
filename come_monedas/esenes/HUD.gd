extends Control

func update_score(new_val):
	$MarginContainer/Label.text = str(new_val)

func update_timer(new_val):
	$MarginContainer/LabelTimer.text = str(new_val)

func update_nivel(new_val):
	$MarginContainer/LabelNivel.text = str(new_val)
	
	
