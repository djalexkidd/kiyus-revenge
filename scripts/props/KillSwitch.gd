extends StaticBody2D

#Et bim! Le terrible Bowser est mort.
#C'est un interrupteur qui fait détruire le pont pour faire tomber le boss

signal pressed

func _on_hitbox_body_entered(body): #Le joueur appuie sur l'interrupteur
	$AnimatedSprite.play("pressed") #Le sprite change
	emit_signal("pressed") #Emet un signal au niveau
	$putain.play()
	$hitbox.queue_free()
	
	if Global.level_unlocks == Global.current_level: #Si le niveau actuel est le niveau à jouer pour débloquer le suivant
		var config = ConfigFile.new()
	
		Global.level_unlocks += 1
		config.set_value("Unlock", "0", Global.level_unlocks) #Débloque le niveau suivant
	
		config.save("user://save.cfg")
