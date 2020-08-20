extends KinematicBody2D



export(int)var speed=200
export(int)var max_speed=250
export (int)var gravity=400
export (int)var jump_speed=10
export(int)var inertia=25
export(int)var accerlation=10
var velocity=Vector2.ZERO
var is_grounded
onready var body=get_node("frendBody")
onready var animation_player=get_node("frendBody/AnimationPlayer")
onready var raycasts=get_node("Raycast")
func move():
	is_grounded=is_on_floor()
	
	var move_direction=int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	velocity.x+=accerlation
	velocity.x=int(lerp(velocity.x,move_direction*speed,friction()))
	if velocity.x==0&&is_on_floor()==true:
		animation_player.play("Idle")
	elif velocity.x!=0&&is_on_floor()==true:
		animation_player.play("Run")
	if move_direction!=0:
		body.scale.x=move_direction
func _physics_process(delta):
	move()
	slide_object()
	velocity.y+= gravity*delta
	velocity=move_and_slide(velocity,Vector2.UP,false,4,PI/4,false)
	if Input.is_action_pressed("ui_up")&&is_grounded:
		velocity.y=-225
	if velocity.y>0:
		animation_player.play("Fall")
	if velocity.y<0:
		animation_player.play("Jump")
	for i in get_slide_count():
		var collision=get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision,self)

func slide_object():
	for index in get_slide_count():
		var collision=get_slide_collision(index)
		if collision.collider.is_in_group("Ball"):
			collision.collider.apply_central_impulse(-collision.normal*inertia)
func friction():
	return 1 if is_on_floor()==true else 0.5


