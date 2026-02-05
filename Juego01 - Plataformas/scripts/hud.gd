extends CanvasLayer  # Capa del HUD siempre visible

@onready var coin_label = $Control/counter_coin/Label # Label de monedas

# Función para actualizar la cantidad de monedas en el HUD
func set_coins(amount):
	coin_label.text = str(amount)+"/10"  # Convierte el número a texto y lo muestra
