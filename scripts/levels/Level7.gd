extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera7.tscn"

func _ready():
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-250, 476)
	add_child(player_character)
	$Kiyu.add_child(camera)
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")

func _physics_process(delta):
	$Kiyu/Camera2D.limit_left += 2
	$Kiyu/Camera2D.limit_right += 2
	$autoscrolldeath.position.x += 2

func _on_autoscrolldeath_body_entered(body):
	body.ouch(position.x)
