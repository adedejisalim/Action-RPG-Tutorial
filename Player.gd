extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80

var velocity = Vector2.ZERO

var animPlayer
onready var animTree = $AnimationTree

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer = $AnimationPlayer
	animTree.active = true;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	
	animTree.set('parameters/blend_posoition', input_vector)
	velocity = move_and_slide(velocity) 
