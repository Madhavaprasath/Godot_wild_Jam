extends TextureProgress

signal val_fin
onready var Petro = get_node(petropath)
export (NodePath) var petropath 
#siganling dino to stop if value is 0
func _ready():
	Petro.connect("flytimeadd",self,"_on_Mom_flytimeadd")
	Petro.connect("flytimeischanging",self,"_on_Mom_flytimeischanging")
	Petro.connect("improper_add",self,"_on_Mom_improper_add")
func _on_Mom_flytimeischanging():
	value-=1
	if value==0:
		emit_signal("val_fin")
		print("hi")
func _on_Mom_flytimeadd():
	while value<1000:
		yield(get_tree().create_timer(0.02),"timeout")
		value+=1

func _on_Mom_improper_add():
	while value<1000&&Petro.flying==false:
		yield(get_tree().create_timer(1),"timeout")
		value+=0.5



