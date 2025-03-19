extends Control

func _on_b_main_menu_pressed():
	Transition.change_scene_to_file(str("res://scenes/" + "MainMenu" + ".tscn"))


func _on_b_main_menu_mouse_entered():
	$MarginContainer/HBoxContainer/HBoxContainer/BMainMenu.modulate = Color("ddd1ff")

func _on_b_main_menu_mouse_exited():
	$MarginContainer/HBoxContainer/HBoxContainer/BMainMenu.modulate = Color("ffffff")

func _on_b_1_pressed():
	Transition.change_scene_to_file(str("res://scenes/" + "Level1" + ".tscn"))


func _on_b_1_mouse_entered():
	$MarginContainer/HBoxContainer/B1.modulate = Color("ddd1ff")


func _on_b_1_mouse_exited():
	$MarginContainer/HBoxContainer/B1.modulate = Color("ffffff")


func _on_b_2_pressed():
	Transition.change_scene_to_file(str("res://scenes/" + "Level2" + ".tscn"))


func _on_b_2_mouse_entered():
	$MarginContainer/HBoxContainer/B2.modulate = Color("ddd1ff")


func _on_b_2_mouse_exited():
	$MarginContainer/HBoxContainer/B2.modulate = Color("ffffff")


func _on_b_back_pressed():
	Transition.change_scene_to_file(str("res://scenes/" + "MainMenu" + ".tscn"))


func _on_b_back_mouse_entered():
	$MarginContainer4/HBoxContainer/BBack.modulate = Color("ddd1ff")


func _on_b_back_mouse_exited():
	$MarginContainer4/HBoxContainer/BBack.modulate = Color("ffffff")
