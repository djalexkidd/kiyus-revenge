extends Node2D

var player_character_path = Global.char_select()
var camera_path = "res://scenes/levels/cameras/Camera2.tscn"

func _ready():
	var player_character = load(player_character_path).instance()
	var camera = load(camera_path).instance()
	player_character.position = Vector2(-48, 476)
	add_child(player_character)
	$Kiyu.add_child(camera)
	move_child($Kiyu, 4)
	
	$fallzone.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")
	$fallzone2.connect("body_entered", $Kiyu, "_on_fallzone_body_entered")
	$PipeEnter1.connect("body_entered", $Kiyu, "_on_PipeEnter1_body_entered")
	$PipeEnter3.connect("body_entered", $Kiyu, "_on_PipeEnter3_body_entered")
	$PipeEnter1.connect("body_exited", $Kiyu, "_on_PipeEnter1_body_exited")
	$PipeEnter3.connect("body_exited", $Kiyu, "_on_PipeEnter3_body_exited")
	
	if Global.pipe_number == 2: #Ah? Quelqu'un est tombé dans le piège ?
		Global.pipe_number = 0 #Réinitialiser l'ID tuyau
		$Kiyu/EnterPipeSound.play() #Jouer le son du tuyau
		$Kiyu.position.x = 5750 #Aïe attention Philippe LE PARAPET !
		$Kiyu.position.y = -1000 #Tombe dans le vide

func _on_block_tilemap_trap_trigger(): #Active le piège tilemap
	$"Tiles Solid".hide() #Cache la tilemap
	$"Tiles Solid".set_collision_layer_bit(1,false) #Et désactive les collisions
	$"Tiles Solid".set_collision_mask_bit(0,false) #Sinon c'est pas drôle
