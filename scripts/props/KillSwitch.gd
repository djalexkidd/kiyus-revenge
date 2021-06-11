extends StaticBody2D

#Et bim! Le terrible Bowser est mort.
#C'est un interrupteur qui fait détruire le pont pour faire tomber le boss

signal pressed

func _on_hitbox_body_entered(body): #Le joueur appuie sur l'interrupteur
	$AnimatedSprite.play("pressed") #Le sprite change
	emit_signal("pressed") #Emet un signal au niveau
	$putain.play()
	$hitbox.queue_free()
