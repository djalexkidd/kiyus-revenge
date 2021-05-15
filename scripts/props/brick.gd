extends StaticBody2D

#La fameuse âme des Toads du royaume champignon, transformée en brique par le méchant Bowser!
#Comme pour le bloc mystère, celle-ci se casse lorsque le joueur frappe par dessous.

#TODO : Implémenter une animation de casse et un son
#J'ai pas fini !

func _on_bottom_checker_body_entered(body):
	queue_free() #Le bloc disparait de la RAM lorsque le joueur frappe le bloc
