extends CanvasLayer

func _ready():
	$Coins.text = String(Global.coins) #Actualise le compteur de pièces
	if Global.fps_counter:
		$FPScounter.show()

func _on_coin_collected(): #Ajoute une piece au compteur
	Global.coins = Global.coins + 1
	_ready()

func _physics_process(delta):
	$Time.text = "%d:%02d" % [floor($Timer.time_left / 60), int($Timer.time_left) % 60] #Affiche le Timer
	if Global.fps_counter: #Compteur de FPS activé
		$FPScounter.text = String(Engine.get_frames_per_second()) #Actualise le compteur de FPS

func _on_Timer_timeout(): #Si le Timer est écoulé
	Global.death_counter += 1
	get_tree().change_scene("res://scenes/menu/GameOver.tscn") #Le joueur pert
