extends Button

func _ready():
	if OS.get_name() == "HTML5":
		queue_free()

func _on_ReturnToMenu_pressed():
	Global.coins = 0
	get_tree().change_scene("res://scenes/menu/TitleMenu.tscn")
