extends KinematicBody2D

var speed = 150
var velocity = Vector2(0,0)
var gravity = 300
var jump = -250

enum {RUN, IDLE, HURT, JUMP}

var state
var current_animation
var new_animation

func transition_to(new_state):
	state = new_state
	match state:
		RUN:
			new_animation = "run"
		IDLE:
			new_animation = "idle"
		HURT:
			new_animation = "hurt"
		JUMP:
			new_animation = "jump"
	
func _ready():
	transition_to(IDLE)
func _physics_process(delta):
	if current_animation != new_animation:
		current_animation = new_animation
		$AnimationPlayer.play(current_animation)
	
	velocity.x = 0
	velocity.y += gravity * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		$playerSheet.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		$playerSheet.flip_h = true
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y =jump
		transition_to(JUMP)
	
	if state ==IDLE and velocity.x !=0:
		transition_to(RUN)
		
	if state == RUN and velocity.x == 0:
		transition_to(IDLE)
	
	if state in [IDLE, RUN] and !is_on_floor():
		transition_to(JUMP)
		
	if state == JUMP and is_on_floor():
		transition_to(IDLE)
		
	velocity =move_and_slide(velocity, Vector2.UP)
