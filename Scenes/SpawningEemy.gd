extends Node2D

const ENEMY = preload("res://Scenes/Enemy.tscn")

func spawn_enemy():
	var enemy = ENEMY.instantiate()
	get_parent().add_child(enemy)
	enemy.position = position
	
func kill():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	pass 
