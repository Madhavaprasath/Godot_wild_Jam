extends Node2D

onready var petro=get_node(Petro)
onready var  frend=get_node(Frend)
export var state = "0"
export (NodePath)var Petro
export(NodePath)var Frend
var alredy_pressed=1
var alredy_pressed_frend=1

func _ready():
	Global.platform_lever_changed()
	pass
func _physics_process(delta):
	if $Area2D.overlaps_body(petro)&&Input.is_action_pressed("e"):
		if state=="0"&&alredy_pressed==1:
			alredy_pressed=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="1"
			$Sprite.flip_h=true
			alredy_pressed=2
		elif state=="0"&&alredy_pressed==2:
			alredy_pressed=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="1"
			$Sprite.flip_h=true
			alredy_pressed=2
		elif state=="1"&&alredy_pressed==1:
			alredy_pressed=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="1"
			$Sprite.flip_h=false
			alredy_pressed=2
		elif state=="1"&&alredy_pressed==2:
			alredy_pressed=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="0"
			$Sprite.flip_h=false
			alredy_pressed=1
		Global.platform_lever_changed()
	
	if $Area2D.overlaps_body(frend)&&Input.is_action_pressed("cntrl"):
		if state=="0"&&alredy_pressed_frend==1:
			alredy_pressed_frend=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="1"
			$Sprite.flip_h=true
			alredy_pressed_frend=2
		elif state=="1"&&alredy_pressed_frend==1:
			alredy_pressed_frend=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="0"
			$Sprite.flip_h=false
			alredy_pressed_frend=2
			alredy_pressed=2
		elif state=="0"&&alredy_pressed_frend==2:
			alredy_pressed_frend=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="0"
			$Sprite.flip_h=true
			alredy_pressed_frend=1
		elif state=="1"&&alredy_pressed_frend==2:
			alredy_pressed_frend=3
			yield(get_tree().create_timer(0.2),"timeout")
			state="0"
			$Sprite.flip_h=false
			alredy_pressed_frend=1
		Global.platform_lever_changed()
