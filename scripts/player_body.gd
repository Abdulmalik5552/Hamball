extends Node3D

@onready var ball_body = $RigidBody3D;
@onready var cloud_particles = $CloudParticles

# Engine power
var emit_at_speed = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = ball_body.position;
	cloud_particles.emitting = ball_body.linear_velocity.length() > emit_at_speed;

