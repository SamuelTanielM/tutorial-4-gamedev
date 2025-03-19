extends Control

func _ready():
	pass
	#await get_tree().create_timer(2.0).timeout  # Optional delay
	#Transition.change_scene_to_file(str("res://scenes/" + "MainMenu" + ".tscn"))
	


func _on_b_main_menu_pressed():
	Transition.change_scene_to_file(str("res://scenes/" + "MainMenu" + ".tscn"))
	pass # Replace with function body.


func _on_b_main_menu_mouse_entered():
	$MarginContainer/HBoxContainer/HBoxContainer/BMainMenu.modulate = Color("ddd1ff")

func _on_b_main_menu_mouse_exited():
	$MarginContainer/HBoxContainer/HBoxContainer/BMainMenu.modulate = Color("ffffff")


func _on_b_restart_pressed():
	Global.lives = 3
	Transition.change_scene_to_file(str("res://scenes/" + "Level1" + ".tscn"))
	pass # Replace with function body.


func _on_b_restart_mouse_entered():
	$MarginContainer/HBoxContainer/HBoxContainer/BRestart.modulate = Color("ddd1ff")

func _on_b_restart_mouse_exited():
	$MarginContainer/HBoxContainer/HBoxContainer/BRestart.modulate = Color("ffffff")
