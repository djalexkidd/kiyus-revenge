extends CanvasLayer

func _ready():
	$Coins.text = String(Global.coins) #Actualise le compteur de pièces
	if Global.fps_counter:
		$FPScounter.show()
	if Global.infinitetime:
		$Timer.queue_free()
		$Panel2.queue_free()
		$Time.queue_free()
	if Input.get_joy_name(0):
		$TouchControls.queue_free()

func _on_coin_collected(): #Ajoute une piece au compteur
	Global.coins = Global.coins + 1
	$Coins.text = String(Global.coins) #Actualise le compteur de pièces

func _physics_process(delta):
	if !Global.infinitetime:
		$Time.text = "%d:%02d" % [floor($Timer.time_left / 60), int($Timer.time_left) % 60] #Affiche le Timer
	if Global.fps_counter: #Compteur de FPS activé
		$FPScounter.text = String(Engine.get_frames_per_second()) #Actualise le compteur de FPS

func _on_Timer_timeout(): #Si le Timer est écoulé
	Global.death_counter += 1
	get_tree().change_scene("res://scenes/menu/GameOver.tscn") #Le joueur pert
