extends Area2D

signal picked

func _on_moneda2D_body_entered(body):
	if body.is_in_group("jug"):
		queue_free()	
		
		emit_signal("picked")
