extends Button

func _on_ReturnToMenu_pressed():
	Global.coins = 0
	get_tree().change_scene("res://scenes/menu/TitleMenu.tscn")
