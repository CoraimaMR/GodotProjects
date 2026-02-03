extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -200.0

@onready var anim = $Sprite2D

func _physics_process(delta: float) -> void:
	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Salto (↑ / Espacio / W)
	if is_on_floor() and (
		Input.is_key_pressed(KEY_SPACE)
		or Input.is_action_just_pressed("ui_up")
		or Input.is_key_pressed(KEY_W)
	):
		velocity.y = JUMP_VELOCITY

	# Movimiento horizontal (Flechas / AD)
	var direction := 0

	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		direction += 1

	if direction != 0:
		velocity.x = direction * SPEED
		anim.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Animaciones
	if not is_on_floor() and velocity.y < 0:
		anim.play("jump")
	elif direction != 0:
		anim.play("walk")
	else:
		anim.play("default")
