extends Node2D

export var code="0"

var codefromlevers=""
var levers =[]

func _ready():
	levers=get_node("levers").get_children()
	Global.connect("Lever_changed",self,"checkpass")


func checkpass():
	codefromlevers=""
	for lever in levers:
		codefromlevers=lever.state
	
	if code==codefromlevers:
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",true)
	else:
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",false)
