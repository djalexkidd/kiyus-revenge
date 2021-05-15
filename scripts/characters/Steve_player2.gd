extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
var SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -1100
var on_pipe
var on_pipe_right

func _physics_process(delta):
	if Input.is_action_pressed("right2"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left2"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
		
	if Input.is_action_pressed("run2"):
		SPEED = 360
	elif Input.is_action_just_released("run2"):
		SPEED = 180
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump2") and is_on_floor():
		velocity.y = JUMPFORCE
		$JumpSound.play()
		
	if Input.is_action_just_pressed("down2") and on_pipe and is_on_floor():
		$AnimationPlayer.play("pipe_enter")
		$EnterPipeSound.play()
	elif Input.is_action_pressed("right2") and on_pipe_right and is_on_floor():
		Input.action_release("right")
		$AnimationPlayer.play("pipe_enter_right")
		$EnterPipeSound.play()
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)

func _on_fallzone_body_entered(body):
	Global.death_counter += 1
	if Global.current_level == 3:
		Global.current_level = 2
	get_tree().change_scene("res://scenes/menu/GameOver.tscn")

func bounce():
	velocity.y = JUMPFORCE * 0.7

func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.4))
	velocity.y = JUMPFORCE * 0.5
	get_node("DeathSound").play()
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	Input.action_release("left2")
	Input.action_release("right2")
	
	$Timer.start()

func _on_Timer_timeout():
	Global.death_counter += 1
	get_tree().change_scene("res://scenes/menu/GameOver.tscn")

func _on_PipeEnter1_body_entered(body):
	on_pipe = true
	Global.pipe_number = 3

func _on_PipeEnter_body_exited(body):
	on_pipe = false
	on_pipe_right = false

func _on_AnimationPlayer_animation_finished(anim_name):
	Global.current_level = Global.pipe_number
	Global.replay()

func _on_PipeEnter2_body_entered(body):
	on_pipe_right = true
	Global.pipe_number = 5
