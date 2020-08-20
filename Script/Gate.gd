extends Node2D
export var hi = ""
export var code="0"
var a=1

var codefromlevers=""
var levers =[]
var not_pressing

func _ready():
	levers=get_node("levers").get_children()
	Global.connect("Lever_changed",self,"checkpass")


func checkpass():
	codefromlevers=""
	for lever in levers:
		codefromlevers=lever.state
		not_pressing=lever.not_presed
	if code==codefromlevers&&a==1:
		a=3
		yield(get_tree().create_timer(0.01),"timeout")
		$"sprites and animationplayer/AnimationPlayer".play("Open")
		yield(get_tree().create_timer(0.2),"timeout")
		a=2
	elif code!=codefromlevers&&a==2:
		a=3
		yield(get_tree().create_timer(0.01),"timeout")
		$"sprites and animationplayer/AnimationPlayer".play("close")
		yield(get_tree().create_timer(0.2),"timeout")
		a=1
