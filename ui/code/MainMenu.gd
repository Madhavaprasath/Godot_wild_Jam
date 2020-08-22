extends Control



#abouth
func _on_about_pressed():
	$abouth.popup()


func _on_tutorial_pressed():
	get_tree().change_scene("res://Levels/tutorial.tscn")
