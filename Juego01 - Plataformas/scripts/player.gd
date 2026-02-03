extends CharacterBody2D # Control del personaje 2D

const SPEED = 150.0 # Velocidad horizontal
const JUMP_VELOCITY = -200.0 # Fuerza del salto (Y negativo = arriba)

@onready var anim = $Sprite2D # Sprite del personaje
@onready var hud = get_node("/root/map/counted") # HUD de monedas

var coins = 0 # Contador de monedas

func add_coin():
	coins += 1 # Suma una moneda
	hud.set_coins(coins) # Actualiza el HUD

func _physics_process(delta: float) -> void:

	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Salto (solo en el suelo)
	if is_on_floor() and (
		Input.is_key_pressed(KEY_SPACE)
		or Input.is_action_just_pressed("ui_up")
		or Input.is_key_pressed(KEY_W)
	):
		velocity.y = JUMP_VELOCITY

	# Movimiento horizontal
	var direction := 0

	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		direction -= 1 # izquierda
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		direction += 1 # derecha

	if direction != 0:
		velocity.x = direction * SPEED
		anim.flip_h = direction < 0 # gira el sprite
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) # freno suave

	move_and_slide() # mueve con colisiones

	# Animaciones
	if not is_on_floor() and velocity.y < 0:
		anim.play("jump")
	elif direction != 0:
		anim.play("walk")
	else:
		anim.play("default")
