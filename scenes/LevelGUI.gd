extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HBoxContainer/Lives.text = "Lives : " + str(Global.lives)


func _on_b_back_pressed():
	Transition.change_scene_to_file(str("res://scenes/" + "MainMenu" + ".tscn"))


func _on_b_back_mouse_entered():
	$HBoxContainer/BBack.modulate = Color("ddd1ff")


func _on_b_back_mouse_exited():
	
	$HBoxContainer/BBack.modulate = Color("ffffff")
