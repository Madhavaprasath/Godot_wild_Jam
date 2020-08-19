extends Node2D

export(NodePath)var petro1
export(NodePath)var frend1
onready var petro=get_node(petro1)
onready var frend=get_node(frend1)
var bodies
var exited_body
signal check_door

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.name=="frend":
		bodies=body
		animation_opened(bodies)
		emit_signal("check_door")
		


func animation_opened(bodies):
	if bodies.name=="frend":
		print("hi")
	if bodies.name=="Ptero":
		print("hello")

func animation_closed(exited_body):
	if exited_body.name=="frend":
		print("bye")
	if exited_body.name=="Ptero":
		print("goodBye!!")
	
func _on_Area2D_body_exited(body):
	if body.name=="frend":
		exited_body=body
		animation_closed(exited_body)
		

func _on_Area2D2_body_entered(body):
	if body.name=="Ptero":
		bodies=body
		animation_opened(bodies)
		emit_signal("check_door")

func _on_Area2D2_body_exited(body):
	if body.name=="Ptero":
		exited_body=body
		animation_closed(exited_body)
		


