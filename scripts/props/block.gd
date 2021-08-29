extends StaticBody2D

#Ceci est le script du bloc [?] mystère venu de Super Mario Bros sorti sur NES en 1985 !
#Cet objet donne une pièce au joueur lorsque celui ci le frappe par dessous.

export var collected = false #Bloc frappé
export var trap = false #Bloc désactivé, mettez des pics en dessous du bloc en guise de piège
export var trap_tilemap = false #Bloc piégé, supprime la tilemap

signal coin_collected #Ajoute une pièce au compteur du HUD
signal tilemap_trap_trigger #Piège pour supprimer la tilemap, faisant tomber le joueur dans le vide

func _ready():
	if collected: #Dans le monde 1-4 des blocs sont désactivés
		$AnimatedSprite.play("empty") #Affiche le sprite du bloc vide
	if Global.difficulty == 0: #Désactive les pièges si la difficulté est réglé sur "Facile"
		trap = false
		trap_tilemap = false

func _on_bottom_checker_body_entered(body):
	if !collected and !trap:
		collected = true
		if trap_tilemap: #Si le bloc contient le piège de la tilemap
			emit_signal("tilemap_trap_trigger") #Envoie un signal au niveau pour supprimer la tilemap
		$AnimationPlayer.play("block_punch")
		$CoinCollect.play() #Joue un son de pièce
		$coin.show()
		$coin/AnimationPlayer.play("bounce_block")
		set_collision_layer_bit(1,false) #Désactive les collisions pour éviter que le joueur frappe deux fois le même bloc
		set_collision_mask_bit(0,false) #Idem
		$bottom_checker.set_collision_mask_bit(0,false) #Idem mais pour la hitbox en dessous du bloc
		emit_signal("coin_collected") #Envoie un signal au HUD pour ajouter une pièce au compteur
	else: #Lorsque le joueur frappe un bloc mais que celui-ci est désactivé, ce son est joué
		$BumpSound.play() 

func _on_AnimationPlayer_animation_finished(anim_name): #Désactivation du bloc
	set_collision_layer_bit(1,true) #Active de nouveau les collisions
	set_collision_mask_bit(0,true) #Idem
	$bottom_checker.set_collision_mask_bit(0,true) #Idem mais pour la hitbox en dessous du bloc
	$AnimatedSprite.play("empty") #Affiche le sprite du bloc vide
	$coin.hide()
