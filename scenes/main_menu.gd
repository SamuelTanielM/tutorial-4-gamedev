extends Control

@export var bplay_scene_to_load: String
@export var blevel_scene_to_load: String

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.lives = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_b_play_pressed():
	Transition.change_scene_to_file("res://scenes/" + bplay_scene_to_load + ".tscn")

func _on_b_level_pressed():
	Transition.change_scene_to_file("res://scenes/" + blevel_scene_to_load + ".tscn")


func _on_b_play_mouse_entered():
	$MarginContainer/HBoxContainer/VBoxContainer/BPlay.modulate = Color("ddd1ff")


func _on_b_level_mouse_entered():
	$MarginContainer/HBoxContainer/VBoxContainer/BLevel.modulate = Color("ddd1ff")


func _on_b_play_mouse_exited():
	$MarginContainer/HBoxContainer/VBoxContainer/BPlay.modulate = Color("ffffff")


func _on_b_level_mouse_exited():
	$MarginContainer/HBoxContainer/VBoxContainer/BLevel.modulate = Color("ffffff")
