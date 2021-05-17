extends Node2D

func _on_block_die_bitch(): #Active le piège tilemap
	$"Tiles Solid".hide() #Cache la tilemap
	$"Tiles Solid".set_collision_layer_bit(1,false) #Et désactive les collisions
	$"Tiles Solid".set_collision_mask_bit(0,false) #Sinon c'est pas drôle
