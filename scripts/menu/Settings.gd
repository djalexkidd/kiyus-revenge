extends Control

func _ready(): #Actualise la configuration à l'accès
	if OS.window_fullscreen:
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_ON"
		$FullscreenLabel/FullscreenButton.pressed = true
	else:
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_OFF"
	if Global.fps_counter:
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_ON"
		$ShowFPSLabel/ShowFPSButton.pressed = true
	else:
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_OFF"
	if Global.multiplayer_enabled:
		$MultiplayerLabel/MultiplayerButton.text = "SETTINGS_VALUE_ON"
		$MultiplayerLabel/MultiplayerButton.pressed = true
	else:
		$MultiplayerLabel/MultiplayerButton.text = "SETTINGS_VALUE_OFF"
	if Global.rumble:
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_ON"
	else:
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_OFF"
		$RumbleLabel/RumbleButton.pressed = false

func _on_FullscreenButton2_toggled(button_pressed): #Plein écran
	if button_pressed:
		OS.window_fullscreen = true
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_ON"
	else:
		OS.window_fullscreen = false
		$FullscreenLabel/FullscreenButton.text = "SETTINGS_VALUE_OFF"

func _on_ShowFPSButton_toggled(button_pressed): #Afficher FPS
	if button_pressed:
		Global.fps_counter = true
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.fps_counter = false
		$ShowFPSLabel/ShowFPSButton.text = "SETTINGS_VALUE_OFF"


func _on_MultiplayerButton_toggled(button_pressed): #Multijoueur
	if button_pressed:
		Global.multiplayer_enabled = true
		$MultiplayerLabel/MultiplayerButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.multiplayer_enabled = false
		$MultiplayerLabel/MultiplayerButton.text = "SETTINGS_VALUE_OFF"

func _on_RumbleButton_toggled(button_pressed): #Vibrations
	if button_pressed:
		Global.rumble = true
		Input.start_joy_vibration(0,1,1,1) #Fait vibrer la manette au moment ou l'option est activée
		Input.vibrate_handheld() #Et le téléphone
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_ON"
	else:
		Global.rumble = false
		$RumbleLabel/RumbleButton.text = "SETTINGS_VALUE_OFF"

func _on_YoutubeButton_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCDsgfEoSz8qpv9jne85T8tg")

func _on_GithubButton_pressed():
	OS.shell_open("https://github.com/djalexkidd")
