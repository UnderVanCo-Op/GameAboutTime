extends KinematicBody2D

var step : int= 20
var jumpHeight : int = 250
var grav : int = 300

var vel = Vector2()

onready var PlayerSprite = get_node("Sprite")

func _physics_process(delta):
	if Input.is_action_pressed("Player_goleft"):
		vel.x -= step
	elif Input.is_action_pressed("Player_goright"):
		vel.x += step
	vel.y += grav * delta
	vel.x *= 0.9
	if (vel.x < 0):
		PlayerSprite.flip_h = false
	if (vel.x > 0):
		PlayerSprite.flip_h = true	
	if Input.is_action_pressed("Player_dojump") && is_on_floor():
		vel.y -= jumpHeight
	
	vel = move_and_slide(vel, Vector2.UP)	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
