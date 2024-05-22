extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body: Node3D):
	if not body.is_in_group("Player"):
		return;
	# Remove Level from Main
	var prev_level = body.get_parent()
	# add next level to Main
	var next_level_index = int(prev_level.get_name().split("_")[1]) + 1
	var next_level_scene = load("res://levels/level_%s.tscn" % next_level_index);
	var main_scene = get_tree().current_scene;
	if next_level_scene == null:
		# TODO: victory screen -> go back to main menu.
		return
	main_scene.remove_child(prev_level);
	main_scene.add_child(next_level_scene.instantiate())
