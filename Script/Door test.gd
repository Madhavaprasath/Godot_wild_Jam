extends Node2D

export (PackedScene)var nextlevel 
onready var petro=get_node("Ptero")
onready var frend=get_node("frend")
onready var frend_door_area=get_node("Doors/Area2D")
onready var petro_door_area=get_node("Doors/Area2D2")
var a=1
var fadeout
func _ready():
	yield(get_tree().create_timer(1),"timeout")
	$CanvasLayer/ColorRect/AnimationPlayer.play("fadeout")
	yield(get_tree().create_timer(0.5),"timeout")
	$CanvasLayer/ColorRect.visible=false
func _physics_process(delta):
	if frend_door_area.overlaps_body(frend)&&petro_door_area.overlaps_body(petro)&&a==1:
		print("levelup")
		a=0
		$Timer.start()


func _on_Timer_timeout():
	set_physics_process(false)
	transition(nextlevel,fadeout)




func _on_game_over_place_body_entered(body):
	if body.name=="Ptero":
		Global.petro_die()
		$CanvasLayer/Tryagain.visible=true
	if body.name=="frend":
		Global.frend_die()
		$CanvasLayer/Tryagain.visible=true

func transition(nextlevel,anim_name):
	get_tree().change_scene_to(nextlevel)
	$CanvasLayer/ColorRect.visible=true
	$CanvasLayer/ColorRect/AnimationPlayer.play(str(anim_name))


