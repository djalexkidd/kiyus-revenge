extends Control

#L'écran titre adapte l'aide aux contrôles selon le périphérique connecté

func _ready():
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	if Input.get_joy_name(0):
		$ControllerDetection.show()
		$Panel.hide()
	else:
		$ControllerDetection.hide()
		$Panel.show()
	
	load_data()

func _on_joy_connection_changed(device_id, connected):
	if connected:
		$ControllerDetection.show()
		$Panel.hide()
	else:
		$ControllerDetection.hide()
		$Panel.show()

func _on_SettingsButton_pressed(): #Bouton des paramètres
	get_tree().change_scene("res://scenes/menu/Settings.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func load_data():
	var config = ConfigFile.new()
	var file2Check = File.new()
	if not file2Check.file_exists("user://save.cfg"):
		config.set_value("Unlock", "0", 1)
		config.save("user://save.cfg")
		return
	
	config.load("user://save.cfg")
	
	var level_unlocked = config.get_value("Unlock", "0")
	Global.level_unlocks = level_unlocked
