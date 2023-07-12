extends CanvasLayer

func _process(delta):
	$labelscore.text = str(get_parent().score)
