extends Node2D
export var code=""
var platforms=[]
var levers=[]
var changed
var codefromlevers
var platformgroups
signal changed

func _ready():
	levers=get_node("lever").get_children()
	Global.connect("Lever_changed",self,"connected")
	platforms=get_node("platforms").get_children()
func connected():
	codefromlevers=""
	for lever in levers:
		codefromlevers=lever.state
	
	if code==codefromlevers:
		changed=true
	else:
		changed=false
