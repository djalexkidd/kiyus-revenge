extends Node2D

func _ready():
	if Global.pipe_number == 4:
		Global.coins = 0
		$HUD._ready()

func _on_KillSwitch_pressed(): #Le niveau reçoit le signal de l'interrupteur
	$Bridge.queue_free() #Le pont se détruit de la RAM

func _on_boss_trigger_body_entered(body):
	$enemies/Paulok/LanceKiyu.start()
	$boss_trigger/PeppaPig.play()

func _on_PeppaPig_finished():
	$boss_trigger.queue_free()
