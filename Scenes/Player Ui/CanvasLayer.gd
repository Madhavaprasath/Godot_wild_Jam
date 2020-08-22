extends CanvasLayer

func pause():
	if Input.is_action_pressed("esc"):
		$Pause_screen.visible=not $Pause_screen.visible
		get_tree().paused = not get_tree().paused


func _on_Timer_timeout():
	pause()


func _on_resume_pressed():
	get_tree().paused=false
	$Pause_screen.visible=false


func _on_restart_pressed():
	get_tree().paused=false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().paused=false
	$ColorRect.visible=true
	$ColorRect/AnimationPlayer.play("fadeout")
	get_tree().change_scene("res://MainMenu.tscn")


func _on_tryagain_restart_pressed():
	$ColorRect.visible=true
	$ColorRect/AnimationPlayer.play("fadeout")
	get_tree().reload_current_scene()



func _on_Quit_pressed():
	$ColorRect.visible=true
	$ColorRect/AnimationPlayer.play("fadeout")
	get_tree().change_scene("res://MainMenu.tscn")
