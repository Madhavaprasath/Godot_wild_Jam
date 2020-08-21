extends Node2D
onready var screen_shake=get_parent().get_node("Camera2D/ScreenShake")
onready var button = get_node(button1)

export(NodePath) var button1 
func _ready():
	button.connect("play_scene",self,"_on_button_play_scene")
	button.connect("play_exit",self,"_on_button_play_exit")
func _on_button_play_scene():
	visible=true
	screen_shake.start(2,25,26,1)
	$AnimationPlayer.play("enter")


func _on_button_play_exit():
	$AnimationPlayer.play("exit")
