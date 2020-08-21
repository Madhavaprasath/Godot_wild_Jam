extends Node2D

export (PackedScene)var nextlevel 
onready var petro=get_node("Ptero")
onready var frend=get_node("frend")
onready var frend_door_area=get_node("Doors/Area2D")
onready var petro_door_area=get_node("Doors/Area2D2")
var a=1
func _physics_process(delta):
	if frend_door_area.overlaps_body(frend)&&petro_door_area.overlaps_body(petro)&&a==1:
		print("levelup")
		a=0
		$Timer.start()


func _on_Timer_timeout():
	set_physics_process(false)
	get_tree().change_scene_to(nextlevel)
