extends Node2D

func _on_KillSwitch_pressed(): #Le niveau reçoit le signal de l'interrupteur
	$TrucQuiTombe.queue_free()

func _on_boss_trigger_body_entered(body):
	$boss_trigger.queue_free()
	$enemies/LeoTechMaker/LanceKiyu.start()
	$SalutCestLeoDeLaChaineTechMaker.play()
	$Musique.stop()
	$BossBattle.play()

func _on_LeoTechMaker_death():
	$Sang/Sprite.show()
	$Sang/Fatality.play()
	$Sang/Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/menu/YouWin.tscn") #Fait terminer le niveau
