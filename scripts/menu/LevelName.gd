extends Label

#C'est un texte affichant le nom du niveau
#Mais aussi la description d'un paramètre

func _on_LevelButton_mouse_exited():
	hide()

#NOMS DES NIVEAUX
func _on_LevelButton1_mouse_entered(): #Niveau 1-1
	show()
	match Global.current_world:
		1:
			text = "WORLDMAP_INFO_LEVEL1"
		2:
			text = "WORLDMAP_INFO_LEVEL5"

func _on_LevelButton2_mouse_entered(): #Niveau 1-2
	show()
	match Global.current_world:
		1:
			text = "WORLDMAP_INFO_LEVEL2"
		2:
			text = "WORLDMAP_INFO_LEVEL6"

func _on_LevelButton3_mouse_entered(): #Niveau 1-3
	show()
	match Global.current_world:
		1:
			text = "WORLDMAP_INFO_LEVEL3"
		2:
			text = "WORLDMAP_INFO_LEVEL7"

func _on_LevelButton4_mouse_entered(): #Niveau 1-4
	show()
	match Global.current_world:
		1:
			text = "WORLDMAP_INFO_LEVEL4"
		2:
			text = "WORLDMAP_INFO_LEVEL8"

#DESCRIPTIONS PARAMÈTRES
func _on_DifficultyButton_mouse_entered(): #Niveau de difficulté
	show()
	text = "SETTINGS_INFO_DIFFICULTY"

func _on_FullscreenButton_mouse_entered(): #Plein écran
	show()
	text = "SETTINGS_INFO_FULLSCREEN"

func _on_ShowFPSButton_mouse_entered(): #Afficher FPS
	show()
	text = "SETTINGS_INFO_SHOWFPS"

func _on_MultiplayerLabel_mouse_entered(): #Multijoueur
	show()
	text = "SETTINGS_INFO_MULTIPLAYER"

func _on_RumbleLabel_mouse_entered(): #Vibrations
	show()
	text = "SETTINGS_INFO_RUMBLE"

func _on_VolumeLabel_mouse_entered(): #Volume
	show()
	text = "SETTINGS_INFO_VOLUME"

func _on_AutoretryLabel_mouse_entered():
	show()
	text = "SETTINGS_INFO_AUTORETRY"

func _on_CRTLabel_mouse_entered():
	show()
	text = "SETTINGS_INFO_CRT"

#DESCRIPTIONS DES MONDES
func _on_WorldButton1_mouse_entered():
	show()
	text = "WORLDMAP_WORLD1"

func _on_WorldButton2_mouse_entered():
	show()
	text = "WORLDMAP_WORLD2"

#DESCRIPTIONS DES CODES DE TRICHE
func _on_GodModeLabel_mouse_entered():
	show()
	text = "CHEATS_INFO_GODMODE"

func _on_HyperspeedLabel_mouse_entered():
	show()
	text = "CHEATS_INFO_HYPERSPEED"

func _on_InfiniteTimeLabel_mouse_entered():
	show()
	text = "CHEATS_INFO_INFINITETIME"

func _on_MoonwalkLabel_mouse_entered():
	show()
	text = "CHEATS_INFO_MOONWALK"

func _on_MoonjumpLabel_mouse_entered():
	show()
	text = "CHEATS_INFO_MOONJUMP"

func _on_Level1_body_entered(body):
	_on_LevelButton1_mouse_entered()

func _on_Level2_body_entered(body):
	_on_LevelButton2_mouse_entered()

func _on_Level3_body_entered(body):
	_on_LevelButton3_mouse_entered()

func _on_Level4_body_entered(body):
	_on_LevelButton4_mouse_entered()
