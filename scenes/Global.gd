extends Node

var last_scene = "Level1"  # Store the last scene name

func set_last_scene(scene_path: String):
	last_scene = scene_path

func get_last_scene() -> String:
	return last_scene
