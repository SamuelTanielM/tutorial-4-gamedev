extends Node2D

func _ready():
	await get_tree().create_timer(2.0).timeout  # Optional delay
	Global.set_last_scene("Level1")
	get_tree().change_scene_to_file(str("res://scenes/Level1.tscn"))
