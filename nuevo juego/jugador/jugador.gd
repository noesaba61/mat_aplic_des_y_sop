extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
  OS.center_window()
  position= Vector2(100, 100)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x += -120 * delta
	if Input.is_action_pressed("ui_right"):
		position.x += 120 * delta
	if Input.is_action_pressed("ui_up"):
		position.y += -120 * delta
	if Input.is_action_pressed("ui_down"):
		position.y += 120 * delta
		
	if position.x <= 0:
		position.x = 0
	if position.x >= 480:
		position.x  =480
	if position.y <= 0:
		position.y = 0
	if position.y >= 720:
		position.y  =720
		
#	position.x =clamp(position.x,0,480)	
#	position.y =clamp(position.x,0,480)
	if Input.is_action_pressed("ui_left") == true:
		get_node("AnimatedSprite").play("run")
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right") == true:
		get_node("AnimatedSprite").play("run")
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_just_pressed("ui_up") == true:
		get_node("AnimatedSprite").play("run")
		$AnimatedSprite.play("run")
	elif Input.is_action_just_pressed("ui_dow") == true:
		get_node("AnimatedSprite").play("run")
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("ible")
		
	
		


func _on_jugador_area_entered(area):
	if area.is_in_group("gem"):
		area.pickup()
		
		$AudioStreamPlayer.play()
		
