extends KinematicBody2D

var velocity = Vector2()
var speed = 0
var gravity = 0
var health = 100

signal hit

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x += speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_boss_trigger_body_entered(body):
	gravity = 20

func _on_Hitbox_body_entered(body):
	if body.name == "Bullet":
		health -= 5
		emit_signal("hit")
		if health == 0:
			$AnimatedSprite.playing = false
			$AnimatedSprite.rotation_degrees = 90
			$DeathSound.play()
	else:
		body.ouch(position.x)

func _on_PaulokLeftSide_body_entered(body):
	speed = 20
	$AnimatedSprite.flip_h = false

func _on_PaulokRightSide_body_entered(body):
	speed = -20
	$AnimatedSprite.flip_h = true

func _on_PeppaPig_finished():
	$Timer.start()

func _on_Timer_timeout():
	speed = -20
