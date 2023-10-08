extends CharacterBody2D

@export var speed: float = 200

signal died

var shot_scene: PackedScene = preload("res://scenes/shot.tscn")

func _physics_process(_delta: float):
	move_and_slide()
	
func _input(event):
	if event.is_action_pressed("move_down"):
		velocity.y += speed
	elif event.is_action_pressed("move_up"):
		velocity.y -= speed
	elif event.is_action_pressed("move_right"):
		velocity.x += speed
	elif event.is_action_pressed("move_left"):
		velocity.x -= speed
	elif event.is_action_released("move_down"):
		velocity.y -= speed
	elif event.is_action_released("move_up"):
		velocity.y += speed
	elif event.is_action_released("move_right"):
		velocity.x -= speed
	elif event.is_action_released("move_left"):
		velocity.x += speed
	elif event.is_action_pressed("fire_main"):
		fire_main()

func fire_main():
	var shot = shot_scene.instantiate()
	shot.position = position + Vector2(50, 0)
	var parent = get_parent()
	parent.add_child(shot)

func on_game_end():
	queue_free()

func on_collide_with_enemy(enemy):
	died.emit()
