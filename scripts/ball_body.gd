extends RigidBody3D

# Engine power
var acceleration = 20

# Variables for input values
var input = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	apply_central_force(input.normalized() * acceleration);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get accelerate/brake input
	input = Vector3.ZERO
	input.z -= Input.get_action_strength("move_forward")
	input.z += Input.get_action_strength("move_back")
	# Get steering input
	input.x = 0
	input.x -= Input.get_action_strength("move_left")
	input.x += Input.get_action_strength("move_right")


