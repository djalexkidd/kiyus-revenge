extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera2a.tscn"

func _ready():
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-448, -288)
	add_child(player_character)
	$Kiyu.add_child(camera)
	move_child($Kiyu, 4)
	
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")
	$PipeEnter2.connect("body_entered", $Kiyu, "_on_PipeEnter2_body_entered")
	$PipeEnter4.connect("body_entered", $Kiyu, "_on_PipeEnter4_body_entered")
	$PipeEnter2.connect("body_exited", $Kiyu, "_on_PipeEnter2_body_exited")
	$PipeEnter4.connect("body_exited", $Kiyu, "_on_PipeEnter4_body_exited")
