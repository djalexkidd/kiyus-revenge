extends Button

#Si vous êtes un gamerz du jeu vidéo GAMING vous pouriez mettre le jeu en difficile...
#Et vous prendre des pièges en boucle !
#C'est une option activable dans les paramètres avec deux niveaux de difficulté :
#Normal = Pièges occasionnels / non frustrant, un platformer de base.
#Difficile = Des pièges PARTOUT, un vrai Die and Retry. Préparez vous à rôter du sang!

func _ready(): #Vérifie l'état du bouton pour correctement le gérer dans les paramètres
	if Global.hard_mode: #Reactive le bouton si celui-ci est activé
		text = "SETTINGS_VALUE_HARD"
		pressed = true
	else:
		text = "SETTINGS_VALUE_NORMAL"

func _on_Difficulty_toggled(button_pressed): #Gère le bouton au clic
	if button_pressed:
		Global.hard_mode = true #Passe en mode difficile
		text = "SETTINGS_VALUE_HARD"
	else:
		Global.hard_mode = false #Passe en mode normal
		text = "SETTINGS_VALUE_NORMAL"
