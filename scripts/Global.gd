extends Node2D

onready var current_level = 1 #Niveau actuel
onready var current_world = 1 #Monde actuel
onready var hard_mode = false #Niveau de difficulté
onready var death_counter = 0 #Nombre de morts
onready var pipe_number = 0 #Identifiant de tuyau
onready var fps_counter = false #Compteur de FPS
onready var rumble = true #Vibrations activées
onready var coins = 0 #Nombre de pièces du joueur

func replay(): #Fonction pour faire changer/redémarrer le niveau
	match current_level:
		1:
			get_tree().change_scene("res://scenes/levels/Level1.tscn")
		2:
			get_tree().change_scene("res://scenes/levels/Level2.tscn")
		3:
			get_tree().change_scene("res://scenes/levels/Level3.tscn")
		4:
			get_tree().change_scene("res://scenes/levels/Level4.tscn")
		5:
			get_tree().change_scene("res://scenes/levels/Level5.tscn")
		8:
			get_tree().change_scene("res://scenes/levels/Level8.tscn")
			
		52:
			get_tree().change_scene("res://scenes/levels/Level2a.tscn")

#1: Niveau 1-1 - Introduction
#2: Niveau 1-2 - Le level design c'est dur
#52: Niveau 1-2 - [Endroit secret]
#3: Niveau 1-3 - Nintendo va me détester
#4: Niveau 1-4 - Super Mario Maker en sueur
#5: Niveau 2-1 - PLACEHOLDER
