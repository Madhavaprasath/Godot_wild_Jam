extends Node

signal Lever_changed

signal platform_lever_changed

func lever_changed():
	
	emit_signal("Lever_changed")
	
func platform_lever_changed():
	
	emit_signal("platform_lever_changed")
	
