extends Area2D

#La pièce est une monnaie dans le jeu qui est, pour l'instant, inutile.
#Dans les permières Alphas du jeu cela permettait de finir le niveau...
#Maintenant complètement useless avec l'arrivée du drapeau de fin.

signal coin_collected

func _on_coin_body_entered(body): #Lorsque le joueur collecte une pièce
	get_node("CollectSound").play() #Un son se joue
	$AnimationPlayer.play("bounce") #Une jolie animation se lance
	emit_signal("coin_collected") #Envoie un signal au HUD pour incrémenter le compteur
	set_collision_mask_bit(0,false) #Désactive les colisions pour éviter la double-collecte

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free() #La pièce disparait de la RAM lorsque l'animation se termine
