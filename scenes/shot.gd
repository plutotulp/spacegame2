extends Area2D

@export var speed = 600
@export var damage = 10

func _ready():
	%TTL.start(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed * delta, 0)

func _on_ttl_timeout():
	queue_free()

func on_exit_world():
	queue_free()

func on_game_end():
	queue_free()

func on_collide_with_enemy(enemy):
	enemy.take_damage(damage)
	queue_free()
