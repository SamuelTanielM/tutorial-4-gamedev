extends Area2D

@export var sceneName: String = "Level1"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.get_name() == "Player":
		Global.set_last_scene(get_tree().current_scene.scene_file_path)
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
