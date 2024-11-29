extends Control 

@onready var button_restart: Button = %ButtonRestart
@onready var button_quit: Button = %ButtonQuit

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
