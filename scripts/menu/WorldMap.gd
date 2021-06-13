extends Control

func _ready():
	$CanvasLayer/GridContainer/LevelButton1.grab_focus()
	match Global.current_world:
		1:
			_on_WorldButton1_pressed()
		2:
			_on_WorldButton2_pressed()

func _physics_process(delta): #Fait bouger la caméra vers la droite pour faire un joli effet paralax
	$Camera2D.offset.x += 20

func _on_LevelButton1_pressed(): #Niveau 1
	match Global.current_world:
		1:
			Global.current_level = 1 #Change le niveau actuel vers le niveau 1-1
		2:
			Global.current_level = 5 #Change le niveau actuel vers le niveau 2-1
	Global.replay() #Charge le niveau

func _on_LevelButton2_pressed(): #Niveau 2
	Global.current_level = 2 #Change le niveau actuel vers le niveau 2
	Global.replay() #Charge le niveau

func _on_LevelButton3_pressed(): #Niveau 3
	Global.current_level = 3 #Change le niveau actuel vers le niveau 3
	Global.replay() #Charge le niveau

func _on_LevelButton4_pressed(): #Niveau 4
	match Global.current_world:
		1:
			Global.current_level = 4 #Change le niveau actuel vers le niveau 1-4
		2:
			Global.current_level = 8 #Change le niveau actuel vers le niveau 2-4
	Global.replay() #Charge le niveau

func _on_WorldButton1_pressed():
	#$Musique.play()
	#$Musique2.stop()
	$"ParallaxBackground/Nearby Blocks/Sprite".set_modulate(Color(1,1,1))
	$"ParallaxBackground/Back Blocks/Sprite".set_modulate(Color(1,1,1))
	$"ParallaxBackground/Middle Blocks/Sprite".set_modulate(Color(1,1,1))
	$"ParallaxBackground/Purple Sky/Sprite".set_modulate(Color(1,1,1))
	$CanvasLayer/Label.text = "WORLDMAP_BIGTITLE"
	Global.current_world = 1
	$CanvasLayer/GridContainer/LevelButton2.disabled = false
	$CanvasLayer/GridContainer/LevelButton3.disabled = false

func _on_WorldButton2_pressed():
	#$Musique.stop()
	#$Musique2.play()
	$"ParallaxBackground/Nearby Blocks/Sprite".set_modulate(Color(1,1,0))
	$"ParallaxBackground/Back Blocks/Sprite".set_modulate(Color(1,1,0))
	$"ParallaxBackground/Middle Blocks/Sprite".set_modulate(Color(1,1,0))
	$"ParallaxBackground/Purple Sky/Sprite".set_modulate(Color(1,1,0))
	$CanvasLayer/Label.text = "WORLDMAP_BIGTITLE2"
	Global.current_world = 2
	$CanvasLayer/GridContainer/LevelButton2.disabled = true
	$CanvasLayer/GridContainer/LevelButton3.disabled = true
