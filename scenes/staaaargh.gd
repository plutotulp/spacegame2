extends Node2D

@export var health: float = 30
@export var score_value: int = 25
@export var damage: float = 10
@onready var health_bar = %HealthBar
@onready var path_follow_2d = %PathFollow2D
@onready var area_2d = %Area2D

signal give_score(value: int)

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	area_2d.connect("area_entered", _on_area_2d_area_entered)
	area_2d.connect("body_entered", _on_area_2d_body_entered)

func _physics_process(delta):
	path_follow_2d.progress += 600 * delta

func on_game_end():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("on_collide_with_enemy"):
		body.on_collide_with_enemy(self)

func _on_area_2d_area_entered(area):
	if area.has_method("on_collide_with_enemy"):
		area.on_collide_with_enemy(self)

func take_damage(amount):
	health -= amount
	health_bar.value = health
	if health < 0:
		die()

func die():
	area_2d.queue_free()
	%Daagh.play()
	%Daagh.connect("finished", queue_free)
	give_score.emit(score_value)

