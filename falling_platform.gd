extends KinematicBody2D
onready var animation_player=$AnimationPlayer
onready var reset_timer=$ResetTimer
var velocity=Vector2()
var is_triggers=false
export var respawn_timer:float=1.0
onready var respawn_position=global_position

func _ready ():
	set_physics_process(false)


func _physics_process(delta):
	velocity.y+=10
	position+=velocity*delta

func collide_with(collision:KinematicCollision2D,collider:KinematicBody2D):
	if !is_triggers:
		is_triggers=true
		animation_player.play("shake")
		velocity=Vector2.ZERO


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
	reset_timer.start(respawn_timer)
func _on_ResetTimer_timeout():
	set_physics_process(false)
	yield(get_tree(),"physics_frame")
	var temp = collision_layer
	collision_layer=0
	global_position=respawn_position
	yield(get_tree(),"physics_frame")
	collision_layer=temp
	is_triggers=false
