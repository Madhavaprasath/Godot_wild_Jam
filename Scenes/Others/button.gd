extends Node2D

signal play_scene
signal play_exit

func _on_Area2D_body_entered(body):
	if body.is_in_group("Ball"):
		$Area2D/Sprite.visible=false
		emit_signal("play_scene")


func _on_Area2D_body_exited(body):
	if body.is_in_group("Ball"):
		$Area2D/Sprite.visible=true
		emit_signal("play_exit")
