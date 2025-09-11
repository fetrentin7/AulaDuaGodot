extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Gravidade
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.play("jumping")
	else:
		velocity.y = 0  
		if abs(velocity.x) > 10:
			sprite_2d.play("running")
		else:
			sprite_2d.play("default")

	# Pulo
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite_2d.play("jumping")

	# Movimento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Flip horizontal
	sprite_2d.flip_h = velocity.x < 0
