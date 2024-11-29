extends Node2D

const WIDTH = 1100
const HEIGHT = 700
const ENEMY = preload("res://Scenes/SpawningEnemy.tscn")

var spawnArea = Rect2()

var delta = 2
var offset = 0.5

func _ready():
	randomize()
	spawnArea = Rect2(0, 0, WIDTH, HEIGHT)
	set_next_spawn()
	
	
func spawn_enemy():
		var position = Vector2(randi()%WIDTH, randi()%HEIGHT)
		var enemy = ENEMY.instantiate()
		enemy.position = position
		$"../Scene objects/CanvasGroup".add_child(enemy)
		return position

func set_next_spawn():
	var nextTime = delta + (randf()- -1)*2*offset
	$Timer.wait_time = nextTime
	$Timer.start()
	
func _on_timeout():
	spawn_enemy()
	set_next_spawn()
	
