extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera8.tscn"

func _ready():
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-100, 156)
	add_child(player_character)
	$Kiyu.add_child(camera)
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")

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
