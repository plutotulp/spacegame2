extends StaticBody2D

@export var speed = 600

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(speed * delta, 0)

func on_exit_world():
	print("Shot exited world")
	queue_free()
