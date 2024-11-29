extends CharacterBody2D
@onready var button_restart: Button = %ButtonRestart
@onready var button_quit: Button = %ButtonQuit

const FORCE = 0.5
const DELTA = 0.2 #3
const SPEED = 30

var velocity2 = Vector2()
var behaviour = Vector2()

func _on_body_entered(body: Node2D):
	if "CharacterBody2D" in body.name:
		print("Game Over!")
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/Gameover.tscn")

func _ready() -> void:
	randomize()
	var theta = randf()*2*PI
	var ampl = (1+(randf()-0.5)*DELTA)*FORCE
	behaviour = Vector2(cos(theta), sin(theta))*ampl
	
func _physics_process(delta):
	var toPlayer = ($"../CharacterBody2D".position - position).normalized()
	velocity2 = (toPlayer + behaviour).normalized()*SPEED
	velocity = velocity2
	move_and_slide()
	orientate()

func orientate():
	if(velocity.y > 0):
		$Body/Eyes.visible = true
	else:
		$Body/Eyes.visible = false
