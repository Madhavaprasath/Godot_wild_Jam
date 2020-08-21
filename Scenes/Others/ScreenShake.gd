extends Node2D

var amplitude=0
var priority=0
onready var camera=get_parent()

func start(duration=0.2,frequency=15,amplitude=16,priority=0):
	if priority>0:
		self.amplitude=amplitude
		self.priority=priority
		
		$End_timer.wait_time=duration
		$Frequency.wait_time=1/float(frequency)
		$Frequency.start()
		$End_timer.start()
	
	new_shake()

func new_shake():
	var rand=Vector2()
	rand.x=rand_range(-amplitude,amplitude)
	rand.y=rand_range(-amplitude,amplitude)
	
	$shake.interpolate_property(camera,"offset",camera.offset,rand,$Frequency.wait_time,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$shake.start()
func reset():
	$shake.interpolate_property(camera,"offset",camera.offset,Vector2(),$Frequency.wait_time,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$shake.start()

func _on_Frequency_timeout():
	new_shake()


func _on_End_timer_timeout():
	reset()
	$Frequency.stop()
