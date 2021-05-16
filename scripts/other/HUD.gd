extends CanvasLayer

func _ready():
	$Coins.text = String(Global.coins) #Actualise le compteur de pièces
	if Global.fps_counter:
		$FPScounter.show()

func _on_coin_collected(): #Ajoute une piece au compteur
	Global.coins = Global.coins + 1
	_ready()

func _physics_process(delta): #Compteur de FPS
	if Global.fps_counter:
		$FPScounter.text = String(Engine.get_frames_per_second()) #Actualise le compteur de FPS
