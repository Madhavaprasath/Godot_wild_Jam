extends KinematicBody2D
onready var energy_bar=get_node(energybar_path)
export (NodePath) var energybar_path
onready var animation_player=get_node("Dino/AnimationPlayer")
var flying=false
onready var raycasts=get_node("Raycasts")


const MAXFLYINGSPEED=-200
const MAXFLYINGDOWN=200 


var a=1
var velocity=Vector2()
var flying_velocity=Vector2()
var up=Vector2(0,-1)
var is_grounded
var value_flight
var flytime
var full_add=false
var interia=100
var dead=false
export (int)var fly_speed=10
signal flytimeischanging
signal flytimeadd
signal improper_add



func _ready():
	energy_bar.connect("val_fin",self,"_on_TextureProgress_val_fin")
	Global.connect("player_die",self,"die")
func _physics_process(delta):

	is_grounded=check_ground()
	gets_input()
	if flying==false:
		velocity.y+=10
		slide_count()
	if velocity.y>0&&is_grounded==false:
		animation_player.play("Land")
		
	velocity=move_and_slide_with_snap(velocity,Vector2.DOWN*64,Vector2.UP,false,4,PI/4,false)
	flying()
	if flying==true:
		flying_velocity=move_and_slide(flying_velocity,up,false,4,PI/4,false)
		emit_signal("flytimeischanging")

func die():
	dead=true
	$Dino/AnimationPlayer.stop()
	print("ahh hurts")

func gets_input():
	var move_direction=int(Input.is_action_pressed("d"))-int(Input.is_action_pressed("a"))
	velocity.x=move_direction*250
	if velocity.x==0&&flying==false:
		if is_on_floor():
			animation_player.play("Idle")
	elif velocity.x!=0&&flying==false&&is_on_floor():
		animation_player.play("Run")
	if move_direction!=0:
		$Dino.scale.x=move_direction


func flying():
	if Input.is_action_pressed("space")&&a==1:
		a=2
		yield(get_tree().create_timer(0.2),"timeout")
		flying=not flying
		yield(get_tree().create_timer(0.2),"timeout")
		a=1
			
	if flying==true:
		var move_direction=int(Input.is_action_pressed("d"))-int(Input.is_action_pressed("a"))
		flying_velocity.x=move_direction*fly_speed
		animation_player.play("Fly")
		if Input.is_action_pressed("w"):
			flying_velocity.y=MAXFLYINGSPEED
		elif Input.is_action_pressed("s"):
				flying_velocity.y=MAXFLYINGDOWN
		else:
			flying_velocity.y=50
	elif flying==false:
		flying_velocity.y+=10 
		if energy_bar.value==0&&full_add==true:
			emit_signal("flytimeadd")
			full_add=false
		elif energy_bar.value<1000&&full_add==false:
			emit_signal("improper_add")
		


func check_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return

func slide_count():
	for index in get_slide_count():
		var collision=get_slide_collision(index)
		if collision.collider.is_in_group("Ball"):
			collision.collider.apply_central_impulse(-collision.normal*interia*0)

func _on_TextureProgress_val_fin():
	flying=false
	full_add=true




