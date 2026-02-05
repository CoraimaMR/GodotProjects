extends Node2D # Control general del nivel

# Constantes del nivel
const COINS_WIN = 10 # Cantidad de monedas para ganar el nivel

# Variables del nivel
var coins = 0 # Contador real de monedas recogidas (vive aquí para no reiniciarse)

@onready var player = $player # Referencia al jugador
@onready var timer = $Timer # Temporizador del nivel
@onready var hud = $hud # Referencia al nodo HUD
@onready var time_label = $hud/counter_time # Label del tiempo dentro del HUD

# Función para sumar monedas y actualizar el HUD
func add_coin():
	coins += 1 # Incrementa el contador global del nivel
	hud.set_coins(coins) # Llama a la función del HUD para mostrar las monedas
	if coins >= COINS_WIN: # Si consigue 10 monedas
		level_completed() # Llama a ganar el nivel

# Función que se ejecuta automáticamente en cada frame del juego
func _process(_delta):
	var time_left := int(timer.time_left) # Segundos restantes
	time_label.text = "Tiempo: " + str(time_left) # Actualiza HUD
	
	# Si el tiempo llega a 0
	if time_left <= 0:
		timer.stop() # Detiene el temporizador
		# Si no tiene las monedas necesarias
		if coins < COINS_WIN:
			get_tree().change_scene_to_file("res://scenes/game_over_menu.tscn") # Menú derrota

func level_completed():
	timer.stop() # Detiene el temporizador
	
	var current_scene = scene_file_path # Obtenemos el nombre completa del mapa actual
	var current_level = current_scene.get_basename().right(1).to_int() # Extraemos el último carácter del nombre
	var next_level = current_level + 1 # Calculamos cuál sería el número siguiente
	var next_map = "res://scenes/map" + str(next_level) + ".tscn" # Construimos el siguiente archivo
	
	if ResourceLoader.exists(next_map): # Verificamos si el archivo del siguiente nivel existe
		get_tree().call_deferred("change_scene_to_file", next_map) # Cargamos el siguiente nivel
	else:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/victory_menu.tscn") # Va al menu de derrota
