extends Control

func _ready():
	if Global.godmode:
		$GodModeLabel/GodModeButton.text = "SETTINGS_VALUE_ON"
		$GodModeLabel/GodModeButton.pressed = true
	else:
		$GodModeLabel/GodModeButton.text = "SETTINGS_VALUE_OFF"
	
	if Global.hyperspeed:
		$HyperspeedLabel/HyperspeedButton.text = "SETTINGS_VALUE_ON"
		$HyperspeedLabel/HyperspeedButton.pressed = true
	else:
		$HyperspeedLabel/HyperspeedButton.text = "SETTINGS_VALUE_OFF"

func _on_GodModeButton_toggled(button_pressed):
	if button_pressed:
		Global.godmode = true
		$GodModeLabel/GodModeButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.godmode = false
		$GodModeLabel/GodModeButton.text = "SETTINGS_VALUE_OFF"

func _on_HyperspeedButton_toggled(button_pressed):
	if button_pressed:
		Global.hyperspeed = true
		$HyperspeedLabel/HyperspeedButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.hyperspeed = false
		$HyperspeedLabel/HyperspeedButton.text = "SETTINGS_VALUE_OFF"

func _on_ReturnToMenu_pressed():
	get_tree().change_scene("res://scenes/menu/WorldMap.tscn")
