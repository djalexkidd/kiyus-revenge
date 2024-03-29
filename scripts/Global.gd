extends Node2D

onready var current_level = 0 #Niveau actuel
onready var current_world = 1 #Monde actuel
onready var difficulty = 1 #Niveau de difficulté
onready var death_counter = 0 #Nombre de morts
onready var pipe_number = 0 #Identifiant de tuyau
onready var fps_counter = false #Compteur de FPS
onready var rumble = true #Vibrations activées
onready var autoretry = false #Redémarrage automatique du niveau
onready var miuifix = false #Forcer les contrôles tactiles
onready var coins = 0 #Nombre de pièces du joueur
onready var character = 1 #Personnage
#Codes de triche
onready var godmode = false #Invinciblilité
onready var hyperspeed = false #Hypervitesse
onready var infinitetime = false #Temps infini
onready var gun = false #Spawn avec le pistolet
onready var moonjump = false #Saut lunaire comme sur l'Action Replay
#Sauvegarde
var level_unlocks = 1

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
		6:
			get_tree().change_scene("res://scenes/levels/Level6.tscn")
		7:
			get_tree().change_scene("res://scenes/levels/Level7.tscn")
		8:
			get_tree().change_scene("res://scenes/levels/Level8.tscn")
		9:
			get_tree().change_scene("res://scenes/levels/Level9.tscn")
		10:
			get_tree().change_scene("res://scenes/levels/Level10.tscn")
		11:
			get_tree().change_scene("res://scenes/levels/Level11.tscn")
		12:
			get_tree().change_scene("res://scenes/levels/Level12.tscn")
		52:
			get_tree().change_scene("res://scenes/levels/Level2a.tscn")
		512:
			get_tree().change_scene("res://scenes/levels/Level12a.tscn")

#1: Niveau 1-1 - Introduction
#2: Niveau 1-2 - Le level design c'est dur
#52: Niveau 1-2 - [Endroit secret]
#3: Niveau 1-3 - Nintendo va me détester
#4: Niveau 1-4 - Super Mario Maker en sueur
#5: Niveau 2-1 - PLACEHOLDER

func char_select():
	match character:
		1:
			return "res://scenes/characters/Kiyu_player.tscn"
		2:
			return "res://scenes/characters/Steve_player.tscn"
		3:
			return "res://scenes/characters/Amogus_player.tscn"
		_:
			return "res://scenes/characters/Kiyu_player.tscn"
