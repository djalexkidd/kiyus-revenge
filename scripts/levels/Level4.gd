extends Node2D

var x = 137

func _ready():
	if Global.pipe_number == 4:
		Global.coins = 0
		$HUD._ready()

func _on_KillSwitch_pressed(): #Le niveau reçoit le signal de l'interrupteur
	$Bridge/Timer.start()

func _on_boss_trigger_body_entered(body):
	$enemies/Paulok/LanceKiyu.start()
	$boss_trigger/PeppaPig.play()

func _on_PeppaPig_finished():
	$boss_trigger.queue_free()

func _on_aaaaa_timeout():
	for i in range(x,152):
		x = x + 1
		$Bridge.set_cell(x,6,-1)
		var explosion_id = get_node("Bridge/explosion" + str(x))
		explosion_id.show()
		explosion_id.play()
		$Bridge/explosion.play()
		Input.start_joy_vibration(0,1,1,1)
		Input.vibrate_handheld()
		break
