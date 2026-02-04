extends CharacterBody2D # Clase base para personajes 2D con movimiento y colisiones

# Constantes del personaje
const SPEED = 150.0 # Velocidad horizontal del personaje
const JUMP_VELOCITY = -250.0 # Velocidad vertical del salto (negativa = hacia arriba)

# Referencias a nodos en la escena
@onready var anim = $Sprite2D # Sprite del personaje para animaciones
@onready var hud = get_node("/root/map/counted") # HUD de monedas (contador)
@onready var jump_sound = $Jump # Sonido que se reproduce al saltar

var coins = 0 # Contador de monedas recogidas

# Función para sumar monedas y actualizar el HUD
func add_coin():
	coins += 1 # Incrementa el contador
	hud.set_coins(coins) # Llama a la función del HUD para mostrar las monedas

# Función principal que se ejecuta cada frame de física
func _physics_process(delta: float) -> void:
   
 # Aplicar gravedad
	if not is_on_floor(): # Si el personaje no está en el suelo
		# Aumenta la velocidad vertical según la gravedad
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta
	
	# Salto
	# Solo se puede saltar si está en el suelo y se presiona la tecla correspondiente
	if is_on_floor() and (Input.is_action_just_pressed("ui_up") 
		or Input.is_key_pressed(KEY_SPACE) 
		or Input.is_key_pressed(KEY_W)):
		velocity.y = JUMP_VELOCITY # Aplica la fuerza del salto
		jump_sound.play() # Reproduce el sonido de salto
	
	# Movimiento horizontal
	var direction := 0 # Dirección horizontal
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		direction -= 1 # Mover a la izquierda
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		direction += 1 # Mover a la derecha

	# Aplicar velocidad horizontal y girar el sprite
	if direction != 0:
		velocity.x = direction * SPEED
		anim.flip_h = direction < 0  # Gira el sprite según la dirección
	else:
		# Desacelera suavemente
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide() # Aplica la velocidad considerando colisiones

	# Animaciones
	if not is_on_floor() and velocity.y < 0:
		anim.play("jump")
	elif direction != 0:
		anim.play("walk")
	else:
		anim.play("default")
