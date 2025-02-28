extends Node2D

func _ready():
	await get_tree().create_timer(2.0).timeout  # Optional delay
	get_tree().change_scene_to_file(Global.get_last_scene())
	
