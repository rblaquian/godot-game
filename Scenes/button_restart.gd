extends Button

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
