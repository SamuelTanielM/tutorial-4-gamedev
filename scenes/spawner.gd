extends Node2D	

@export var obstacle : PackedScene

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + randf_range(-1000, 1000)
	spawned.global_position = spawn_pos

	# Schedule the spawned object to be deleted after 3 seconds
	await get_tree().create_timer(3.5).timeout
	if spawned:  # Ensure the object still exists before deleting
		spawned.queue_free()

func repeat():
	spawn()
	await get_tree().create_timer(2).timeout
	repeat()
