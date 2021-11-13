extends Node2D

var x = 137
var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera4.tscn"

func _ready():
	if Global.pipe_number == 4:
		Global.coins = 0
		$HUD._ready()
	
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-100, 156)
	add_child(player_character)
	$Kiyu.add_child(camera)
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")

func _on_KillSwitch_pressed(): #Le niveau reçoit le signal de l'interrupteur
	$Bridge/Timer.start()

func _on_boss_trigger_body_entered(body):
	$boss_trigger.queue_free()
	$enemies/Paulok/LanceKiyu.start()
	$PeppaPig.play()
	$Musique.stop()
	$BossBattle.play()

func _on_aaaaa_timeout():
	for i in range(x,152):
		var explosion_id = get_node("Bridge/explosion" + str(x+1))
		explosion_id.show()
		explosion_id.play()
		$Bridge.set_cell(x,6,-1)
		$Bridge/explosion.play()
		if Global.rumble: #Fait vibrer la manette si l'option est activée
			Input.start_joy_vibration(0,1,1,1)
			Input.vibrate_handheld()
		x += 1
		break
