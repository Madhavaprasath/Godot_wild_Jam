extends Node2D

onready var platform=get_node("platform") 
onready var tween=get_node("Tween")

const IDLE_DURATION=1.0
export (NodePath)var platformpar1
onready var platformpar=get_node(platformpar1)

export (bool) var iscontroledbylever=false
export var speed=3.0
export var move_to=Vector2.RIGHT*128

var follow = Vector2.ZERO
var changing

func _ready():
		_init_tween()
	
func _init_tween():
	if iscontroledbylever==false:
		var duration=move_to.length()/float(speed*64)
		tween.interpolate_property(self,"follow",Vector2.ZERO,move_to,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,IDLE_DURATION)
		tween.interpolate_property(self,"follow",move_to,Vector2.ZERO,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,duration+IDLE_DURATION*2)
		tween.start()
	elif iscontroledbylever==true:
		print("hi")

func _physics_process(_delta):
	platform.position=platform.position.linear_interpolate(follow,0.075)


