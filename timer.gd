extends Node2D
var time=300
export (NodePath) var pause_path
onready var pause=get_node(pause_path)
onready var tryagain=get_parent().get_node("Tryagain")

func timer_check():
	if time==0:
		Global.petro_die()
		Global.frend_die()
		tryagain.visible=true
		$Timer.stop()
		pass
	else:
		pass
func update_time(text):
	$Label.text=str(text)

func _on_Timer_timeout():
	update_time(time)
	timer_check()
	on_paused()
func on_paused():
	if pause.visible==true:
		time-=0
	else:
		time-=1

	
