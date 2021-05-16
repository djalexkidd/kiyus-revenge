extends StaticBody2D

#Comme pour le bloc mystère, celle-ci se casse lorsque le joueur frappe par dessous.

#TODO : Implémenter une animation de casse

func _on_bottom_checker_body_entered(body):
	set_collision_layer_bit(1,false)
	set_collision_mask_bit(0,false)
	$bottom_checker.set_collision_mask_bit(0,false)
	hide()
	$BreakSound.play()

func _on_BreakSound_finished():
	queue_free() #Le bloc disparait de la RAM lorsque le son se termine.
