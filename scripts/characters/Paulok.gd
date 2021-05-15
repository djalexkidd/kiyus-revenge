extends KinematicBody2D

#Et salut à tous les amis, c'eeeest PAULOK !
#Le boss à la fin de chaque château, il vous lance Kiyu dans la figure en guise d'attaque

const speed = 50 #Gravité
var velocity = Vector2()

var kiyu_ressource = preload("res://scenes/characters/Kiyu.tscn")

func _physics_process(delta):
	velocity.y += 20
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _on_fallzone2_body_entered(body):
	$PaulokCrySound.play()

func _on_PaulokCrySound_finished():
	get_tree().change_scene("res://scenes/menu/YouWin.tscn")

func _on_LanceKiyu_timeout():
	var kiyu = kiyu_ressource.instance()
	add_child(kiyu)

func _on_boss_trigger_body_entered(body):
	$LanceKiyu.start()

func _on_KillSwitch_pressed():
	$LanceKiyu.stop()

func _on_hitbox_body_entered(body):
	body.ouch(position.x)
