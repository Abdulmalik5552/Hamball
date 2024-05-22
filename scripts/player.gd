extends RigidBody3D

@onready var ball_mesh = $CollisionShape3D/MeshInstance3D;
@onready var pivot = $Pivot;
@onready var cloud_particles = $Pivot/CloudParticles;
@onready var ground_ray = $Pivot/RayCast3D;
@onready var camera = $Pivot/ThirdPersonCamera/YawCam;

# Engine power
var acceleration = 20


# Variables for input values
var input = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	apply_central_force((input.normalized() * acceleration).rotated(Vector3.UP, camera.rotation.y));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pivot.position = position
	# Get accelerate/brake input
	input = Vector3.ZERO
	input.z -= Input.get_action_strength("move_forward")
	input.z += Input.get_action_strength("move_back")
	# Get steering input
	input.x = 0
	input.x -= Input.get_action_strength("move_left")
	input.x += Input.get_action_strength("move_right")
	if ground_ray.is_colliding() == false:
		input /= 2;
		#cloud_particles.emitting = false
	cloud_particles.emitting = linear_velocity.length() > acceleration;
	
	if position.y < -100:
		_kill_player();

func _kill_player():
	queue_free();
