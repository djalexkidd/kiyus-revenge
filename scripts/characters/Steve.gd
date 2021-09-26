extends KinematicBody2D

#Steve était le personnage jouable dans la version Alpha du jeu.
#Il a depuis été remplacé par Kiyu, le chat de PAULOK !

var velocity = Vector2(0,0)
var SPEED = 180 #Vitesse du joueur
const GRAVITY = 35 #Gravité
const JUMPFORCE = -1100 #Hauteur du saut
var on_pipe #Vérifie si le joueur est proche d'un tuyau en bas
var on_pipe_right #Vérifie si le joueur est proche d'un tuyau à droite

func _ready():
	if Global.hyperspeed:
		SPEED = 720
		$Sprite.speed_scale = 4

func _physics_process(delta):
	if Input.is_action_pressed("right"): #Touche droite
		velocity.x = SPEED
		$Sprite.play("walk") #Joue l'animation de marche
		if !Global.moonwalk:
			$Sprite.flip_h = false #N'inverse pas le sprite horizontalement
		else:
			$Sprite.flip_h = true
	elif Input.is_action_pressed("left"): #Touche gauche
		velocity.x = -SPEED
		$Sprite.play("walk") #Joue l'animation de marche
		if !Global.moonwalk:
			$Sprite.flip_h = true #Inverse pas le sprite horizontalement
		else:
			$Sprite.flip_h = false
	else: #Joueur immobile
		$Sprite.play("idle") #Animation par défaut
	
	if Input.is_action_just_pressed("jump") and is_on_floor(): #Touche de saut
		jump()
	
	if Input.is_action_just_released("jump"):
		jump_cut()
	
	if Input.is_action_just_pressed("jump") and is_on_wall() and not is_on_floor(): #Touche de saut sur un mur
		walljump()
	
	if Input.is_action_pressed("jump") and Global.moonjump: #Touche de saut
		jump()
	
	if not is_on_floor():
		$Sprite.play("air")
	if Input.is_action_pressed("right") and on_pipe_right and is_on_floor():
		Input.action_release("right")
		$AnimationPlayer.play("pipe_enter_right")
		$EnterPipeSound.play()
	if Input.is_action_pressed("run"):
		if !Global.hyperspeed:
			SPEED = 360
			$Sprite.speed_scale = 2
		else:
			SPEED = 1440
			$Sprite.speed_scale = 8
	elif Input.is_action_just_released("run"):
		if !Global.hyperspeed:
			SPEED = 180
			$Sprite.speed_scale = 1
		else:
			SPEED = 720
			$Sprite.speed_scale = 4
	
	velocity.y = velocity.y + GRAVITY
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
	if Input.is_action_just_pressed("down") and on_pipe and is_on_floor(): #Touche bas sur un tuyau
		on_pipe = false
		$AnimationPlayer.play("pipe_enter") #Animation d'entrée dans le tuyau
		if Global.pipe_number == 1: #Pour le tuyau piégé du niveau 1-2
			$CollisionShape2D.disabled = true #Désactive les collisions
			$Camera2D.limit_bottom = 100000 #Change les limites de la caméra pour montrer le dessous de la map
		$EnterPipeSound.play() #Joue le son du tuyau

func _on_fallzone_body_entered(body): #Le joueur tombe dans un trou
	Global.death_counter += 1 #Incrémente le compteur de morts
	if !Global.autoretry:
		get_tree().change_scene("res://scenes/menu/GameOver.tscn") #Affiche l'écran de Game Over
	else:
		Global.replay()

func bounce():
	velocity.y = JUMPFORCE * 0.7

func jump():
	velocity.y = JUMPFORCE
	$JumpSound.play() #Son de saut

func jump_cut():
	if velocity.y < -100:
		velocity.y = -35

func walljump(): #Fonction pour le walljump
	Input.action_release("left") #Lâche la touche gauche
	Input.action_release("right") #Lâche la touche droite
	if $Sprite.flip_h: #Si le sprite est tourné vers la gauche
		velocity.x = 1600 #Propulse le joueur vers la droite
	else: #Si le sprite est tourné vers la droite
		velocity.x = -1600 #Propulse le joueur vers la gauche
	velocity.y = JUMPFORCE #Fait sauter le joueur
	$JumpSound.play() #Joue le son de saut

func ouch(var enemyposx): #Si le joueur prend un dégat
	if !Global.godmode:
		set_collision_layer_bit(0,false) #Désactive les collisions
		set_collision_mask_bit(0,false)
		set_modulate(Color(1,0.3,0.3,0.4)) #Change la couleur du joueur en rouge
		velocity.y = JUMPFORCE * 0.5 #Fait un petit saut
		get_node("DeathSound").play() #Joue le son de mort (oof)
	
		if position.x < enemyposx:
			velocity.x = -800
		elif position.x > enemyposx:
			velocity.x = 800
		
	
		if Global.rumble: #Fait vibrer la manette si l'option est activée
			Input.start_joy_vibration(0,1,1,1)
			Input.vibrate_handheld()
	
		Input.action_release("left") #Lâche la touche gauche
		Input.action_release("right") #Lâche la touche droite
	
		$Timer.start() #Démarre un timer avant d'afficher l'écran de Game Over

func _on_Timer_timeout(): #Le timer de mort se termine
	Global.death_counter += 1 #Incrémente le compteur de morts
	if !Global.autoretry:
		get_tree().change_scene("res://scenes/menu/GameOver.tscn") #Affiche l'écran de Game Over
	else:
		Global.replay()

func _on_PipeEnter1_body_entered(body): #Endroit secret niveau 1-2
	on_pipe = true
	Global.pipe_number = 52

func _on_PipeEnter2_body_entered(body): #Warp zone niveau 1-4
	on_pipe = true
	Global.pipe_number = 4

func _on_PipeEnter3_body_entered(body): #Piège
	on_pipe = true
	Global.pipe_number = 1

func _on_PipeEnter4_body_entered(body): #Niveau 1-2
	on_pipe_right = true
	Global.pipe_number = 2

func _on_PipeEnter_body_exited(body):
	on_pipe = false
	on_pipe_right = false

func _on_AnimationPlayer_animation_finished(anim_name): #Animation de tuyau terminé
	$CollisionShape2D.disabled = false #Active les collisions
	if Global.pipe_number == 1: #Pour le tuyau piégé du niveau 1-2
		set_position(get_position() + Vector2(0, 50)) #Déplace le joueur 50 pixels en dessous
		$EnterPipeSound.play() #Joue le son du tuyau
	else: #Pour tout les autres tuyaux
		Global.current_level = Global.pipe_number #Change la scène actuelle
		Global.replay() #Charge la scène
