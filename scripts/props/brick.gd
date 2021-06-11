extends StaticBody2D

#Comme pour le bloc mystère, celle-ci se casse lorsque le joueur frappe par dessous.

#TODO : Implémenter une animation de casse

func _on_bottom_checker_body_entered(body):
	set_collision_layer_bit(1,false)
	set_collision_mask_bit(0,false)
	set_collision_mask_bit(4,false)
	set_collision_mask_bit(5,false)
	$bottom_checker.set_collision_mask_bit(0,false)
	$AnimatedSprite.hide()
	$BreakSound.play()
	
	$break1.show()
	$break1/AnimationPlayer.play("break1")
	
	$break2.show()
	$break2/AnimationPlayer.play("break2")
	
	$break3.show()
	$break3/AnimationPlayer.play("break3")
	
	$break4.show()
	$break4/AnimationPlayer.play("break4")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
