extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):

	if not is_on_floor():
		
	else:
		

	# Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		

	# Movimento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		
	else:
	

	move_and_slide()
