extends Area2D
signal landed


func _on_Object_body_entered(body):
	if body.name=="Mom":
		print("you dont belong here")
		emit_signal("landed")
	
