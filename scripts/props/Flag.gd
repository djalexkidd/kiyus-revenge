extends Area2D

#C'est un joli drapeau qui, lorsque le joueur l'atteint, fait terminer le niveau

func _on_Flag_body_entered(body): #Le joueur touche le drapeau
	$AnimatedSprite.play("enabled") #Fait lever le drapeau
	set_collision_mask_bit(0,false) #Désactive ses collisions pour évider de l'activer deux fois
	$Timer.start() #Démarre un timer car c'est plus propre comme ça
	
	#Pour sauvegarder la partie
	if Global.level_unlocks == Global.current_level: #Si le niveau actuel est le niveau à jouer pour débloquer le suivant
		var config = ConfigFile.new()
	
		Global.level_unlocks += 1
		config.set_value("Unlock", "0", Global.level_unlocks) #Débloque le niveau suivant
	
		config.save("user://save.cfg")

func _on_Timer_timeout(): #Le timer est terminé
	get_tree().change_scene("res://scenes/menu/YouWin.tscn") #Fait terminer le niveau
