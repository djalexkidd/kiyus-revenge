extends Area2D

#Une barre de feu qui tourne comme dans les niveaux *-4 de Super Mario Bros

var rotate = 0.035 #Vitesse de rotation

func _physics_process(delta):
	rotation += rotate #La barre de feu tourne

func _on_FireBar_body_entered(body): #Lorsque le joueur touche la barre de feu (c'est chaud ptn)
	body.ouch(position.x) #oof, le joueur meurt

func _on_FireTrap_body_entered(body): #Lorsque le joueur rentre dans le piège
	rotate = 1 #Le piège est déclenché
