extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera6.tscn"

func _ready():
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-448, -288)
	add_child(player_character)
	$Kiyu.add_child(camera)
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")
