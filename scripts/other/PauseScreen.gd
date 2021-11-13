extends Popup

var already_paused
var selected_menu

func _input(event):
	if not visible:
		if Input.is_action_just_pressed("start"):
			# Pause game
			already_paused = get_tree().paused
			$PauseSound.play()
			get_tree().paused = true
			# Reset the popup
			selected_menu = 0
			# Show popup
			popup_centered()
			popup()
	else:
		if Input.is_action_just_pressed("ui_down"):
			selected_menu = (selected_menu + 1) % 3;
			$Pointer.set_valign(selected_menu)
			$SelectSound.play()
		elif Input.is_action_just_pressed("ui_up"):
			if selected_menu > 0:
				selected_menu = selected_menu - 1
				$Pointer.set_valign(selected_menu)
			else:
				selected_menu = 2
				$Pointer.set_valign(selected_menu)
			$SelectSound.play()
		elif Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("start"):
			match selected_menu:
				0:
					# Resume game
					if not already_paused:
						Input.action_release("jump")
						get_tree().paused = false
					hide()
					$UnpauseSound.play()
				1:
					# Restart game
					Global.replay()
					get_tree().paused = false
				2:
					# Quit game
					get_tree().paused = false
					Global.coins = 0
					get_tree().change_scene("res://scenes/menu/NewWorldMap.tscn")
