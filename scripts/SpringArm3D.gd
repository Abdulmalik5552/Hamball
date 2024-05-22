extends Node3D

@onready var yaw_node = $YawCam;
@onready var pitch_node = $YawCam/PitchCam;

var yaw: float = 0.0
var pitch: float = 0.0

var yaw_sensativity: float = 0.09;
var pitch_sensativity: float = 0.07;

var min_pitch: float = -55;
var max_pitch: float = 70;

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

func _input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * yaw_sensativity;
		pitch -= event.relative.y * pitch_sensativity;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pitch = clampf(pitch, min_pitch, max_pitch);
	
	#yaw_node.rotation_degrees.y = lerp(rotation_degrees.y, yaw, yaw_acceleration * delta);
	#pitch_node.rotation_degrees.x = lerp(rotation_degrees.x, pitch, pitch_acceleration * delta);
	
	yaw_node.rotation_degrees.y = yaw
	pitch_node.rotation_degrees.x = pitch
