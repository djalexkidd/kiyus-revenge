extends KinematicBody2D

var velocity = Vector2(0,0)
var SPEED = 180 #Vitesse du joueur

func _physics_process(delta):
	if Input.is_action_pressed("right"): #Touche droite
		velocity.x = SPEED
		$Sprite.play("walk") #Joue l'animation de marche
		$Sprite.flip_h = false #N'inverse pas le sprite horizontalement
	elif Input.is_action_pressed("left"): #Touche gauche
		velocity.x = -SPEED
		$Sprite.play("walk") #Joue l'animation de marche
		$Sprite.flip_h = true #Inverse le sprite horizontalement
	elif Input.is_action_pressed("down"): #Touche bas
		velocity.y = SPEED
		$Sprite.play("walk") #Joue l'animation de marche
	elif Input.is_action_pressed("up"): #Touche heut
		velocity.y = -SPEED
		$Sprite.play("walk") #Joue l'animation de marche
	else: #Joueur immobile
		$Sprite.play("idle") #Animation par défaut
	
	if Input.is_action_just_pressed("jump") and Global.current_level != 0:
		Global.replay()
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	velocity.y = lerp(velocity.y,0,0.2)
