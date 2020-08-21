extends Node

signal Lever_changed

signal platform_lever_changed
signal player_die
signal frend_die
func lever_changed():
	
	emit_signal("Lever_changed")
	
func platform_lever_changed():
	
	emit_signal("platform_lever_changed")
	
func petro_die():
	emit_signal("player_die")
func frend_die():
	emit_signal("frend_die")
