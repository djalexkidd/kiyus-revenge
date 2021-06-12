extends Node2D

func _on_KillSwitch_pressed(): #Le niveau reçoit le signal de l'interrupteur
	#$spikesBoss/SpikeBoss15/Sprite

func _on_boss_trigger_body_entered(body):
	$enemies/LeoTechMaker/LanceKiyu.start()
	$boss_trigger/SalutCestLeoDeLaChaineTechMaker.play()

func _on_PeppaPig_finished():
	$boss_trigger.queue_free()
