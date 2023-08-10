extends KinematicBody2D

var speed = 500 #Vitesse
var velocity = Vector2()
export var direction = -1 #-1 = Direction vers la gauche, 1 = Direction vers la droite

func _physics_process(delta):
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_sides_checker_body_entered(body): # Le joueur se fait toucher
	body.ouch(position.x)

func _on_Timer_timeout():
	direction = direction * -1
