extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var axis = Vector2.ZERO
var velocity2 = Vector2.ZERO
var direction = KEY_DOWN

func _on_body_entered(body: Node2D):
	if "CharacterBody2D" in body.name:
		print("Game Over")
		queue_free()
		get_tree().paused = true
		get_tree().change_scene_to_file("res://Scenes/Gameover.tscn")
		
func _physics_process(delta: float) -> void:
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(event.position != position):
				var direction = (event.position - position).normalized()
