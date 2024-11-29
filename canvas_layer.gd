extends CanvasLayer
@onready var game_timer: Timer = $GameTimer
@onready var label_timer: Label = $GameTimer/LabelTimer
@onready var button_restart: Button = %ButtonRestart
@onready var button_quit: Button = %ButtonQuit

const game_over = preload("res://Scenes/Congratulations.tscn")
var seconds = 0
var minutes = 0 

func _ready():
	game_timer.set_wait_time(60)
	
	if !game_timer.is_stopped(): 
		game_timer.stop()
		var game = game_over.instantiate()
		
	game_timer.start()
	await game_timer.timeout

func _process(delta: float) -> void:
	var time_left = int(game_timer.time_left)
	
	if time_left > 0:
		minutes = time_left / 60  
		seconds = time_left % 60  
	else:
		_on_game_timer_timeout()
	
	var seconds_text = str(seconds)
	if seconds < 10:
		seconds_text = "0" + seconds_text
	label_timer.text = str(minutes) + ":" + seconds_text

func _on_game_timer_timeout():
		get_tree().change_scene_to_file("res://Scenes/Congratulations.tscn")
		
		
