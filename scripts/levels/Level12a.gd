extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera12a.tscn"

var boss_battle = false

func _ready():
	if Global.pipe_number == 4:
		Global.coins = 0
		$HUD._ready()
	
	$HUD/Timer.start(600)
	
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(65, -2000)
	add_child(player_character)
	$Kiyu.add_child(camera)
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")

func _on_boss_trigger_body_entered(body):
	$Kiyu/Camera2D.limit_left = 4936
	$Kiyu/Camera2D.limit_top = -200
	$Kiyu/Camera2D.limit_bottom = -2000
	$PeppaPig.play()
	$HUD/PaulokHealth.show()
	boss_battle = true
	$boss_trigger.queue_free()

func _on_PaulokFinalBoss_hit():
	$HUD/PaulokHealth.value = $enemies/PaulokFinalBoss.health

func _on_Musique_finished():
	if boss_battle:
		$BossBattle.play()
	else:
		$Musique.play()
