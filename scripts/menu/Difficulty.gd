extends Button

#Si vous êtes un gamerz du jeu vidéo GAMING vous pouriez mettre le jeu en difficile...
#Et vous prendre des pièges en boucle !
#C'est une option activable dans les paramètres avec trois niveaux de difficulté :
#Facile = Peu de pièges présents. (0)
#Normal = Tous pièges sont activés et visibles. (1)
#Difficile = Tous pièges sont activés mais invisibles. (2)

func _ready(): #Vérifie l'état du bouton pour correctement le gérer dans les paramètres
	match Global.difficulty:
		0:
			text = "SETTINGS_VALUE_EASY"
		1:
			text = "SETTINGS_VALUE_NORMAL"
		2:
			text = "SETTINGS_VALUE_HARD"

func _on_DifficultyButton_pressed():
	match Global.difficulty:
		0:
			Global.difficulty = 1
			text = "SETTINGS_VALUE_NORMAL"
		1:
			Global.difficulty = 2
			text = "SETTINGS_VALUE_HARD"
		2:
			Global.difficulty = 0
			text = "SETTINGS_VALUE_EASY"
