extends KinematicBody2D

var velocity = Vector2(0,0)
var SPEED = 180 #Vitesse du joueur
const GRAVITY = 35 #Gravité
const JUMPFORCE = -1100 #Hauteur du saut
var on_pipe #Vérifie si le joueur est proche d'un tuyau
var on_pipe_right

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$JumpSound.play()
	
	if Input.is_action_just_pressed("jump") and is_on_wall() and not is_on_floor():
		walljump()
	
	if not is_on_floor():
		$Sprite.play("air")
	if Input.is_action_pressed("right") and on_pipe_right and is_on_floor():
		Input.action_release("right")
		$AnimationPlayer.play("pipe_enter_right")
		$EnterPipeSound.play()
	if Input.is_action_pressed("run"):
		SPEED = 360
	elif Input.is_action_just_released("run"):
		SPEED = 180
	
	velocity.y = velocity.y + GRAVITY
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	if Input.is_action_just_pressed("down") and on_pipe and is_on_floor():
		$AnimationPlayer.play("pipe_enter")
		if Global.pipe_number == 1:
			$CollisionShape2D.disabled = true
			$Camera2D.limit_bottom = 100000
		$EnterPipeSound.play()

func _on_fallzone_body_entered(body):
	Global.death_counter += 1
	get_tree().change_scene("res://scenes/menu/GameOver.tscn")

func bounce():
	velocity.y = JUMPFORCE * 0.7

func walljump():
	Input.action_release("left")
	Input.action_release("right")
	if $Sprite.flip_h:
		velocity.x = 1600
	else:
		velocity.x = -1600
	velocity.y = JUMPFORCE
	$JumpSound.play()

func ouch(var enemyposx):
	set_collision_layer_bit(0,false)
	set_collision_mask_bit(0,false)
	set_modulate(Color(1,0.3,0.3,0.4))
	velocity.y = JUMPFORCE * 0.5
	get_node("DeathSound").play()
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	
	if Global.rumble:
		Input.start_joy_vibration(0,1,1,1)
		Input.vibrate_handheld()
	
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()

func _on_Timer_timeout():
	Global.death_counter += 1
	get_tree().change_scene("res://scenes/menu/GameOver.tscn")

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

func _on_AnimationPlayer_animation_finished(anim_name):
	$CollisionShape2D.disabled = false
	if Global.pipe_number == 1:
		set_position(get_position() + Vector2(0, 50))
		$EnterPipeSound.play()
	else:
		Global.current_level = Global.pipe_number
		Global.replay()
