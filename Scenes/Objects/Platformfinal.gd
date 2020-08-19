extends Node2D

export (NodePath)var platformpar1
onready var platformpar=get_node(platformpar1)
func _ready():
	platformpar.connect("changed",self,"on_changed")
	

func on_changed():
	if platformpar.changed==true:
		$AnimationPlayer.play("Vertical")
		yield(get_tree().create_timer(2),"timeout")
	elif platformpar.changed== false:
		$AnimationPlayer.stop()





