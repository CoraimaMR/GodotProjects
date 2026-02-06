extends PathFollow2D #PATHFOLLW BEE

# Constantes para el camino
const SPEED = 20.0

# Referencias a nodos en la escena
@onready var anim: AnimatedSprite2D = $bee/AnimatedSprite2D
@onready var last_x: float = global_position.x

# Variables para el comino
var moving: bool = true

# Función especial que se llama en cada frame visual del juego
func _process(delta: float) -> void:
	if moving: # Si queremos que se mueva
		progress += SPEED * delta
		
		# Calculamos hacia dónde se mueve comparando con la última posición
		var current_x = global_position.x
		var movement_direction = current_x - last_x
		
		if movement_direction != 0:
			# flip_h = true si se mueve a la izquierda, false si va a la derecha
			anim.flip_h = movement_direction < 0
		
		# Actualizamos la posición para el siguiente frame
		last_x = current_x
