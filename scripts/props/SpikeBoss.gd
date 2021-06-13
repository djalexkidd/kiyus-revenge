extends KinematicBody2D

#Des pics pour tuer Léo TechMaker

var velocity = Vector2(0,0)
const GRAVITY = 35 #Gravité

signal boss_death

func _physics_process(delta):
	velocity.y = velocity.y + GRAVITY
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)

func _on_hitbox_body_entered(body):
	body.ouch(position.x) #Et le joueur meurt

func ouch(var enemyposx):
	emit_signal("boss_death")
