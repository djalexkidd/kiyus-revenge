extends Area2D

#C'est un joli drapeau qui, lorsque le joueur l'atteint, fait terminer le niveau

func _on_Flag_body_entered(body): #Le joueur touche le drapeau
	$AnimatedSprite.play("enabled") #Fait lever le drapeau
	set_collision_mask_bit(0,false) #Désactive ses collisions pour évider de l'activer deux fois
	$Timer.start() #Démarre un timer car c'est plus propre comme ça

func _on_Timer_timeout(): #Le timer est terminé
	get_tree().change_scene("res://scenes/menu/YouWin.tscn") #Fait terminer le niveau
