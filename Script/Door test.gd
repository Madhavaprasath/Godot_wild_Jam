extends Node2D

onready var petro=get_node("Ptero")
onready var frend=get_node("frend")
onready var frend_door_area=get_node("Doors/Area2D")
onready var petro_door_area=get_node("Doors/Area2D2")
var a=0
func _physics_process(delta):
	if frend_door_area.overlaps_body(frend)&&petro_door_area.overlaps_body(petro)&&a==0:
		a=1
		yield(get_tree().create_timer(1),"timeout")
		print("levelup")
		yield(get_tree().create_timer(1),"timeout")
		a=0
		pass

