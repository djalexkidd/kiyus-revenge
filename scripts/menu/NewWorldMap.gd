extends Node2D

func _on_Level_body_exited(body):
	Global.current_level = 0
	$Bar/LevelName.hide()

func _on_Level1_body_entered(body):
	Global.current_level = 1

func _on_Level2_body_entered(body):
	Global.current_level = 2

func _on_Level3_body_entered(body):
	Global.current_level = 3

func _on_Level4_body_entered(body):
	Global.current_level = 4
