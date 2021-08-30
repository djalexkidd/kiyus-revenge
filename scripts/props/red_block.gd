extends StaticBody2D

#Ce bloc fait OOF quand il est frappé.

func _on_bottom_checker_body_entered(body):
	$AnimationPlayer.play("block_punch")
	$CoinCollect.play() #Joue un son de oof
	$coin/AnimationPlayer.play("bounce_block")
	set_collision_layer_bit(1,false) #Désactive les collisions pour éviter que le joueur frappe deux fois le même bloc
	set_collision_mask_bit(0,false) #Idem
	$bottom_checker.set_collision_mask_bit(0,false) #Idem mais pour la hitbox en dessous du bloc

func _on_AnimationPlayer_animation_finished(anim_name): #Désactivation du bloc
	set_collision_layer_bit(1,true) #Active de nouveau les collisions
	set_collision_mask_bit(0,true) #Idem
	$bottom_checker.set_collision_mask_bit(0,true) #Idem mais pour la hitbox en dessous du bloc
	if OS.get_name() == "Android":
		get_tree().change_scene("res://scenes/menu/Cheats.tscn")
