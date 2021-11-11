extends Button

func _ready():
	grab_focus()
	Global.coins = 0
	if Global.current_level == 4:
		disabled = true

func _on_NextLevel_pressed():
	Global.coins = 0
	Global.current_level += 1
	Global.replay()

func _on_ReturnToMap_pressed():
	Global.coins = 0
	get_tree().change_scene("res://scenes/menu/NewWorldMap.tscn")
