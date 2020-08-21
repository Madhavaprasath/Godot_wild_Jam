extends Node2D

func _ready():
	pause()

func pause():
	if Input.is_action_pressed("esc"):
		visible=true
		get_tree().paused=not get_tree().paused
		


func _on_resume_pressed():
	get_tree().paused=false
	visible=false
