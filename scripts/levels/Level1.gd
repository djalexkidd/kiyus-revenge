extends Node2D

func _ready():
	if Global.multiplayer_enabled: #Fonction Multijoueur
		var player2_ressource = preload("res://scenes/characters/Steve_player2.tscn")
		var player2 = player2_ressource.instance()
		add_child(player2)
