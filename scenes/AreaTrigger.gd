extends Area2D

@export var sceneName: String = "Level1"
@export var Lives: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_body_entered(body):
	var current_scene = get_tree().get_current_scene().get_name()
	if body.get_name() == "Player":
		Global.set_last_scene(get_tree().current_scene.scene_file_path)
		if (Lives == 100):
			Global.lives = 3
		else:
			Global.lives += Lives
			
		if (Global.lives == 0):
			Transition.change_scene_to_file(str("res://scenes/" + "LoseScreen" + ".tscn"))
		else:
			if (sceneName == "CurrentScreen"):
				Transition.change_scene_to_file(Global.get_last_scene())
			else:
				Transition.change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
			
