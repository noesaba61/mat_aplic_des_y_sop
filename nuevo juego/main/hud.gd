extends Control

func update_score(new_val):
	$MarginContainer/Labelscore.text = str(new_val)

func update_timer(new_val):
	$MarginContainer/Labeltimer.text = str(new_val) 
	
