extends Node3D

var player_scene = preload("res://player.tscn")
var player: Node = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null:
		var new_player = player_scene.instantiate();
		new_player.position = position;
		get_parent().add_child(new_player)
		player = new_player
