extends KinematicBody2D

var speed = 100 #Vitesse
var velocity = Vector2()
export var directiony = -1 #-1 = Direction vers le haut, 1 = Direction vers le bas
export var directionx = 0 #-1 = Direction vers la gauche, 1 = Direction vers la droite

func _physics_process(delta):
	velocity.y = speed * directiony
	velocity.x = speed * directionx
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_Timer_timeout():
	directiony = directiony * -1
	directionx = directionx * -1
