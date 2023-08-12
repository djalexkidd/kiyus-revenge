extends KinematicBody2D

#Et salut à tous les amis, c'eeeest PAULOK !
#Le boss à la fin de chaque château, il vous lance Kiyu dans la figure en guise d'attaque

const speed = 50 #Gravité
var velocity = Vector2()

signal death

var kiyu_ressource = preload("res://scenes/props/Kiyu.tscn")

func _physics_process(delta): #Déplace Paulok vers le bas pour qu'il tombe dans le vide
	velocity.y += 20
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_fallzone2_body_entered(body): #Si Paulok atteint la zone en dessous
	$PaulokCrySound.play() #Paulok joue un son

func _on_PaulokCrySound_finished(): #Après que le son soit fini
	get_tree().change_scene("res://scenes/menu/YouWin.tscn") #Le joueur gagne

func _on_LanceKiyu_timeout(): #Paulok lance Kiyu (un projectile) toutes les secondes
	var kiyu = kiyu_ressource.instance() #Instance kiyu en tant que noeud enfant de Paulok
	add_child(kiyu) #L'ajoute dans la scène

func _on_boss_trigger_body_entered(body): #Le joueur atteint une zone avant le boss
	$LanceKiyu.start() #Démarre un timer pour 1 seconde en boucle

func _on_KillSwitch_pressed(): #Le joueur appuie sur l'interupteur
	$LanceKiyu.stop() #Paulok arrête de lancer Kiyu

func _on_hitbox_body_entered(body): #Le joueur touche Paulok
		body.ouch(position.x)

func _on_SpikeBoss12_boss_death():
	emit_signal("death")
	queue_free()

func ouch(var enemyposx):
	pass
