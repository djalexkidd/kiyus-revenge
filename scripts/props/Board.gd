extends KinematicBody2D

var speed = 100 #Vitesse
var velocity = Vector2()
export var direction = -1 #-1 = Direction vers le haut, 1 = Direction vers le bas

func _physics_process(delta):
	velocity.y = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_Timer_timeout():
	direction = direction * -1
