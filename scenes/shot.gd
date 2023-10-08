extends Area2D

@export var speed = 600

func _ready():
	%TTL.start(4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed * delta, 0)

func _on_ttl_timeout():
	queue_free()
