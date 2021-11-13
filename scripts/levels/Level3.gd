extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera3.tscn"

func _ready():
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-448, -288)
	add_child(player_character)
	$Kiyu.add_child(camera)
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")

func _on_block_tilemap_trap_trigger(): #Active le piège tilemap
	$"Tiles Solid".hide() #Cache la tilemap
	$"Tiles Solid".set_collision_layer_bit(1,false) #Et désactive les collisions
	$"Tiles Solid".set_collision_mask_bit(0,false) #Sinon c'est pas drôle
