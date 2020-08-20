extends Node2D
export var code="0"
var platforms=[]
var levers=[]
var changed
var codefromlevers
var platformgroups
signal changed

func _ready():
	levers=get_node("platforlevers").get_children()
	Global.connect("platform_lever_changed",self,"connected")
	platforms=get_node("platforms").get_children()
	emit_signal("changed")
func connected():
	codefromlevers=""	for lever in levers:
		codefromlevers=lever.stater
		print("hello")
		print(codefromlevers)
	if code==codefromlevers:
		changed=true
		emit_signal("changed")
		yield(get_tree().create_timer(0.2),"timeout")
	else:
		changed=false
		emit_signal("changed")
