extends Node2D

@onready var score: int = 0

signal game_end

func _ready():
	show_score()
	%Staaaargh.connect("give_score", on_give_score)

func show_score():
	%Score.text = "%s" % score

func add_score(amount):
	score += amount
	show_score()

func on_give_score(value: int):
	add_score(value)

func _on_ship_died():
	game_end.emit()

func _on_game_end():
	%GameOver.visible = true
	%Ohoh.play()
	for child in get_children():
		if child.has_method("on_game_end"):
			child.on_game_end()
