extends Label

#C'est un compteur de mort pour savoir Ô combien vous êtes nul au jeu vidéal
#Il s'affiche sur l'écran de Game Over et sur la carte du monde

func _ready():
	text = String(Global.death_counter) #Actualise le compteur
