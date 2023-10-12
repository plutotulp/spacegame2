extends Node2D

# States:
#   0 - main menu
#   1 - running game
@onready var state = 0

@onready var game_scene = preload("res://scenes/game.tscn")
var game

func _input(event):
	if state == 0 and event.is_action_pressed("start_game"):
		start_game()

func start_game():
	%GameOver.visible = false
	%StartGame.visible = false
	game = game_scene.instantiate()
	game.connect("game_over", _on_game_game_over)
	add_child(game)
	state = 1
	
func _on_game_game_over():
	%GameOver.visible = true
	%StartGame.visible = true
	game.queue_free()
	state = 0
