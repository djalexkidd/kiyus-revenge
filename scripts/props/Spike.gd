extends Area2D

#Les pics sont des pièges venus de Sonic sur Mega Drive
#Sauf que la, ils sont invisibles et vous tuent au toucher
#Heureusement ces pièges ne sont actifs que en mode difficile

func _ready():
	if Global.difficulty == 2: #Si le jeu est en difficile
		$Sprite.hide() #Le sprite est caché pour la surprise
	elif Global.difficulty == 0: #Au contraire si il est en facile
		queue_free() #Le piège n'est même pas présent en RAM
#Le piège est visible en difficulté normale

func _on_Spike_body_entered(body): #Le joueur touche un pic
	$Sprite.show() #Le piège s'affiche
	body.ouch(position.x) #Et le joueur meurt
