extends Button

func _on_PlayButton_pressed():
	Global.coins = 0
	get_tree().change_scene("res://scenes/menu/NewWorldMap.tscn")

func _on_ReplayButton_pressed():
	Global.coins = 0
	if Global.current_level == 52:
		Global.current_level = 2
	Global.replay()
