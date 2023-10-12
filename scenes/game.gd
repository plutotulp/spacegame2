extends Node2D

@onready var score: int = 0
@onready var staaargh_scene: PackedScene = preload("res://scenes/staaaargh.tscn")
@onready var ship = %Ship

signal game_over

func _ready():
	show_score()
	%Staaaargh.connect("give_score", _on_staaaargh_give_score)

func show_score():
	%Score.text = "%s" % score

func add_score(amount):
	score += amount
	show_score()

func spawn_staaargh():
	var size = get_viewport().get_visible_rect().size
	var x = randi_range(0, size.x)
	var y = randi_range(0, size.y)
	var staaargh = staaargh_scene.instantiate()
	staaargh.connect("give_score", _on_staaaargh_give_score)

func _on_ship_died():
	game_over.emit()

func _on_staaaargh_give_score(value):
	add_score(value)
