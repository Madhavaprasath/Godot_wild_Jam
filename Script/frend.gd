extends KinematicBody2D




export(int)var speed=250
export(int)var max_speed=250
export (int)var gravity=900
export (int)var jump_speed=400
export(int)var inertia=25
export(int)var accerlation=10
var velocity=Vector2()
var is_grounded
onready var body=get_node("frendBody")
onready var animation_player=get_node("frendBody/AnimationPlayer")
var dead = false
var snap = false
var move_direction
func _ready():
	Global.connect("frend_die",self,"die")
func _physics_process(delta):
	move_direction=int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	velocity.x=lerp(velocity.x,move_direction*speed,friction())
	slide_object()
	if velocity.y>0:
		animation_player.play("Fall")
	if Input.is_action_pressed("ui_up") and snap:
		velocity.y=-jump_speed
		animation_player.play("Jump")
		snap = false
		
	velocity.y+=gravity*delta
	var snap_vector = Vector2(0,32)if snap else Vector2()
	velocity=move_and_slide_with_snap(velocity,snap_vector,Vector2.UP,false,4,PI/4,false)
	if is_on_floor() and Input.is_action_just_released("ui_left")or Input.is_action_just_released("ui_right"):
		velocity.y=0
	
	var just_landed=is_on_floor() and not snap
	if just_landed:
		snap=true
		
	for i in get_slide_count():
		var collision=get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision,self)
 
	update_animation()

func update_animation():
	if move_direction!=0:
		body.scale.x=move_direction
	if abs(velocity.x)==0&&is_on_floor():
		animation_player.play("Idle")
	if velocity.x>0 ||velocity.x<-0:
		animation_player.play("Run")
	if velocity.y>0&&!is_on_floor():
		animation_player.play("Fall")
func die():
	dead=true
	animation_player.stop()
	print("ouch")
func slide_object():
	for index in get_slide_count():
		var collision=get_slide_collision(index)
		if collision.collider.is_in_group("Ball"):
			collision.collider.apply_central_impulse(-collision.normal*inertia)
		if collision.collider.is_in_group("Crate"):
			collision.collider.apply_central_impulse(-collision.normal*inertia*2.5)
func friction():
	return 1 if is_on_floor()==true else 0.5
