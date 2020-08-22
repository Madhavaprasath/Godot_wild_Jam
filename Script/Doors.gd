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
		$Area2D/AnimationPlayer.play("Open")
		$Area2D/AudioStreamPlayer2D.play()
	if bodies.name=="Ptero":
		$Area2D2/AnimationPlayer.play("open")
		$Area2D2/AudioStreamPlayer2D.play()

func animation_closed(exited_body):
	if exited_body.name=="frend":
		$Area2D/AnimationPlayer.play("close")
		$Area2D/AudioStreamPlayer2D.stop()
	if exited_body.name=="Ptero":
		$Area2D2/AnimationPlayer.play("close")
		$Area2D2/AudioStreamPlayer2D.stop()
	
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
		


