extends Label

#C'est un compteur de mort pour savoir Ô combien vous êtes nul au jeu vidéal
#Il s'affiche sur l'écran de Game Over et sur la carte du monde

func _ready():
	text = String(Global.death_counter) #Actualise le compteur

#La partie qui suit est en fait le compteur de mort gère aussi les boutons sur la CdM

func _on_LevelButton1_pressed(): #Niveau 1
	Global.current_level = 1 #Change le niveau actuel vers le niveau 1
	Global.replay() #Charge le niveau

func _on_LevelButton2_pressed(): #Niveau 2
	Global.current_level = 2 #Change le niveau actuel vers le niveau 2
	Global.replay() #Charge le niveau

func _on_LevelButton3_pressed(): #Niveau 3
	Global.current_level = 3 #Change le niveau actuel vers le niveau 3
	Global.replay() #Charge le niveau

func _on_LevelButton4_pressed(): #Niveau 4
	Global.current_level = 4 #Change le niveau actuel vers le niveau 4
	Global.replay() #Charge le niveau
