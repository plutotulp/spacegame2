extends Path2D

@export var health: float = 30
@export var score_value: int = 25

signal give_score(value: int)

func _ready():
	%PathFollow2D/Area2D/HealthBar.max_value = health
	%PathFollow2D/Area2D/HealthBar.value = health

func _physics_process(delta):
	%PathFollow2D.progress += 600 * delta

func on_game_end():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("on_collide_with_enemy"):
		body.on_collide_with_enemy(self)


func _on_area_2d_area_entered(area):
	if area.has_method("on_collide_with_enemy"):
		area.on_collide_with_enemy(self)

func damage(amount):
	health -= amount
	%PathFollow2D/Area2D/HealthBar.value = health
	if health < 0:
		die()

func die():
	visible = false
	%Daagh.play()
	%Daagh.connect("finished", queue_free)
	give_score.emit(score_value)

