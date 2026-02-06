extends Node2D # BOMB

# Referencias a nodos en la escena
@onready var anim = $AnimatedSprite2D
@onready var path_follow = get_parent() as PathFollow2D
@onready var ded_bomb = $RetroExplode

# Área que impulsa al jugador hacia arriba
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		body.velocity.y = -300 # Aplica un impulso hacia arriba
		dead_bomb() # LLamo a la función
		await anim.animation_finished # Cuando la animación termine
		queue_free() # Se elimina tras usarse

# Área que mata al jugador
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	# Comprobar si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		dead_bomb() # LLamo a la función
		await ded_bomb.finished # Cuando la explosión termine
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over_menu.tscn") # Va al menu de derrota

# Función que desactiva las areas y aplica efectos de explosión
func dead_bomb():
	for area in [$Area2D, $Area2D2]: # Desactiva las colisiones
			area.set_deferred("monitoring", false)
		
	path_follow.moving = false # Detener movimiento
	ded_bomb.play() # Sonido de explosión
	anim.play("dead_bomb") # Animación muerte de la bomba
