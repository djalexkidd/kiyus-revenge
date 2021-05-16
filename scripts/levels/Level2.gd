extends Node2D

func _ready():
	if Global.multiplayer_enabled: #Fonction Multijoueur
		var player2_ressource = preload("res://scenes/characters/Steve_player2.tscn")
		var player2 = player2_ressource.instance()
		add_child(player2)
	if Global.pipe_number == 2: #Ah? Quelqu'un est tombé dans le piège ?
		Global.pipe_number = 0 #Réinitialiser l'ID tuyau
		$Kiyu/EnterPipeSound.play() #Jouer le son du tuyau
		$Kiyu.position.x = 5750 #Aïe attention Philippe LE PARAPET !
		$Kiyu.position.y = -1000 #Tombe dans le vide

func _on_block_die_bitch(): #Active le piège tilemap
	$"Tiles Solid".hide() #Cache la tilemap
	$"Tiles Solid".set_collision_layer_bit(1,false) #Et désactive les collisions
	$"Tiles Solid".set_collision_mask_bit(0,false) #Sinon c'est pas drôle
