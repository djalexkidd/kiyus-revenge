extends StaticBody2D

func _on_spring_body_entered(body):
	body.velocity.y = body.JUMPFORCE * 1.5
	$AnimatedSprite.play("ON")
	$spring_sound.play()
	$Timer.start()
	$squeeze.start()

func _on_Timer_timeout():
	$AnimatedSprite.play("OFF")

func _on_squeeze_timeout():
	$kiyu_spring.play()
