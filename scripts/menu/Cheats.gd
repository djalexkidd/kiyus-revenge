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
	
	if Global.infinitetime:
		$InfiniteTimeLabel/InfiniteTimeButton.text = "SETTINGS_VALUE_ON"
		$InfiniteTimeLabel/InfiniteTimeButton.pressed = true
	else:
		$InfiniteTimeLabel/InfiniteTimeButton.text = "SETTINGS_VALUE_OFF"
		
	if Global.moonwalk:
		$MoonwalkLabel/MoonwalkButton.text = "SETTINGS_VALUE_ON"
		$MoonwalkLabel/MoonwalkButton.pressed = true
	else:
		$MoonwalkLabel/MoonwalkButton.text = "SETTINGS_VALUE_OFF"

	if Global.moonjump:
		$MoonjumpLabel/MoonjumpButton.text = "SETTINGS_VALUE_ON"
		$MoonjumpLabel/MoonjumpButton.pressed = true
	else:
		$MoonjumpLabel/MoonjumpButton.text = "SETTINGS_VALUE_OFF"

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

func _on_InfiniteTimeButton_toggled(button_pressed):
	if button_pressed:
		Global.infinitetime = true
		$InfiniteTimeLabel/InfiniteTimeButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.infinitetime = false
		$InfiniteTimeLabel/InfiniteTimeButton.text = "SETTINGS_VALUE_OFF"

func _on_MoonwalkButton_toggled(button_pressed):
	if button_pressed:
		Global.moonwalk = true
		$MoonwalkLabel/MoonwalkButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.moonwalk = false
		$MoonwalkLabel/MoonwalkButton.text = "SETTINGS_VALUE_OFF"

func _on_MoonjumpButton_toggled(button_pressed):
	if button_pressed:
		Global.moonjump = true
		$MoonjumpLabel/MoonjumpButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.moonjump = false
		$MoonjumpLabel/MoonjumpButton.text = "SETTINGS_VALUE_OFF"

func _on_ReturnToMenu_pressed():
	get_tree().change_scene("res://scenes/menu/WorldMap.tscn")
