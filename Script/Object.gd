extends Area2D
signal landed_petro
signal landed_frend

func _on_Object_body_entered(body):
		
		if body.name=="Ptero":
			emit_signal("landed_petro")
		if body.name=="frend":
			emit_signal("landed_frend")
		print(body.name)
	
