extends Node2D

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
	$PipeEnter5.connect("body_entered", $Kiyu, "_on_PipeEnter5_body_entered")
	move_child($Kiyu, 4)
