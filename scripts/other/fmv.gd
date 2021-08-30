extends Control

func _ready():
	if OS.get_name() == "Android" or OS.get_name() == "HTML5":
		get_tree().change_scene("res://scenes/menu/TitleMenu.tscn")

func _on_VideoPlayer_finished():
	get_tree().change_scene("res://scenes/menu/TitleMenu.tscn")
