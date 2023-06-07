extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
  OS.center_window()
  position= Vector2(100, 100)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
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
	
		
