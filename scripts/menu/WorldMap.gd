extends Control

func _ready():
	$CanvasLayer/GridContainer/LevelButton1.grab_focus()

func _physics_process(delta): #Fait bouger la caméra vers la droite pour faire un joli effet paralax
	$Camera2D.offset.x += 20

func _on_LevelButton1_pressed(): #Niveau 1
	Global.current_level = 1 #Change le niveau actuel vers le niveau 1
	Global.replay() #Charge le niveau

func _on_LevelButton2_pressed(): #Niveau 2
	Global.current_level = 2 #Change le niveau actuel vers le niveau 2
	Global.replay() #Charge le niveau

func _on_LevelButton3_pressed(): #Niveau 3
	Global.current_level = 3 #Change le niveau actuel vers le niveau 3
	Global.replay() #Charge le niveau

func _on_LevelButton4_pressed(): #Niveau 4
	Global.current_level = 4 #Change le niveau actuel vers le niveau 4
	Global.replay() #Charge le niveau

func _on_WorldButton1_pressed():
	pass # Replace with function body.

func _on_WorldButton2_pressed():
	pass # Replace with function body.
