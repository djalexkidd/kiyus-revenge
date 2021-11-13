extends KinematicBody2D

var velocity = Vector2(0,0)
var SPEED = 180 #Vitesse du joueur
var select

signal open_menu
signal next_char
signal prev_char

func _physics_process(delta):
	if Input.is_action_pressed("right") and not select: #Touche droite
		velocity.x = SPEED
		$Sprite.play("walk") #Joue l'animation de marche
		$Sprite.flip_h = false #N'inverse pas le sprite horizontalement
	elif Input.is_action_just_pressed("right") and select:
		emit_signal("next_char")
	elif Input.is_action_pressed("left") and not select: #Touche gauche
		velocity.x = -SPEED
		$Sprite.play("walk") #Joue l'animation de marche
		$Sprite.flip_h = true #Inverse le sprite horizontalement
	elif Input.is_action_just_pressed("left") and select:
		emit_signal("prev_char")
	elif Input.is_action_pressed("down") and not select: #Touche bas
		velocity.y = SPEED
		$Sprite.play("walk") #Joue l'animation de marche
	elif Input.is_action_pressed("up") and not select: #Touche heut
		velocity.y = -SPEED
		$Sprite.play("walk") #Joue l'animation de marche
	else: #Joueur immobile
		$Sprite.play("idle") #Animation par défaut
	
	if Input.is_action_just_pressed("jump") and Global.current_level != 0 and not select:
		emit_signal("open_menu")
	elif Input.is_action_just_pressed("jump") and Global.current_level != 0 and select:
		Global.replay()
	
	if Input.is_action_just_pressed("run") and not select:
		get_tree().change_scene("res://scenes/menu/TitleMenu.tscn")
	elif Input.is_action_just_pressed("run") and select:
		emit_signal("open_menu")
	
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene("res://scenes/menu/WorldMap.tscn")
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.5)
	velocity.y = lerp(velocity.y,0,0.5)
