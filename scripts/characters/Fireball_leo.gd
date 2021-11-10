extends KinematicBody2D

#Kiyu, le fameux chat de PAULOK, est présent dans le jeu. SKOUIZI!!1!
#C'est un projectile lancé par PAULOK, le boss à la fin de chaque château.

const speed = 700 #Vitesse aérienne
const speedy = 20
var velocity = Vector2()
var directiony = -1 #-1 = Direction vers le haut, 1 = Direction vers le bas

func _ready():
	position = Vector2(-100,0)
	$KiyuSound.play()

func _physics_process(delta):
	velocity.x = -speed #Kiyu se déplace vers la gauche
	velocity.y = speed * directiony
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_Kiyu_body_entered(body): #Lorsque le joueur se cogne contre le gros Q de Kiyu
	body.ouch(position.x) #Le joueur meurt

func _on_Timer_timeout():
	directiony *= -1
