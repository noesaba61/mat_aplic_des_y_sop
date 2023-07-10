extends CanvasLayer

func _process(delta):
	$LabelScore.text = str(get_parent().score)
