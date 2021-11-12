extends Node2D

func _on_Level_body_exited(body):
	$HUD/Bar/LevelName.hide()
	$AntiBug.start()

func _on_Level1_body_entered(body):
	Global.current_level = 1

func _on_Level2_body_entered(body):
	Global.current_level = 2

func _on_Level3_body_entered(body):
	Global.current_level = 3

func _on_Level4_body_entered(body):
	Global.current_level = 4

func _on_AntiBug_timeout():
	Global.current_level = 0
