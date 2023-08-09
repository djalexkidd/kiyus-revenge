extends KinematicBody2D

var velocity = Vector2()
var speed = 700
var orientation

func _ready():
	if get_node("../Kiyu/Sprite").flip_h:
		orientation = true
		set_position(get_node("../Kiyu").get_position() + Vector2(-100,8))
	else:
		orientation = false
		set_position(get_node("../Kiyu").get_position() + Vector2(100,8))
	$AudioStreamPlayer.play()

func _physics_process(delta):
	if orientation:
		velocity.x = -speed
	else:
		velocity.x = speed
	velocity = move_and_slide(velocity)

func ouch(var enemyposx):
	pass

func bounce():
	pass

func _on_Timer_timeout():
	queue_free()
