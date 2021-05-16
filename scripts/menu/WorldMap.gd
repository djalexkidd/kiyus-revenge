extends Control

func _ready():
	$CanvasLayer/GridContainer/LevelButton1.grab_focus()

func _physics_process(delta): #Fait bouger la caméra vers la droite pour faire un joli effet paralax
	$Camera2D.offset.x += 20
