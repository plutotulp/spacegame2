extends CharacterBody2D

const PI_QUART: float = PI / 4.0
const PI_HALF: float = PI / 2.0

const PUSH_SPEED: float = 100.0
const STRAFE_SPEED: float= 100.0
const ROT_SPEED: float = 0.05

func _physics_process(delta: float):
	rotation += sign(Vector2.from_angle(rotation).angle_to((get_viewport().get_mouse_position() - position).normalized())) * ROT_SPEED
	
	var push = Vector2.from_angle(rotation) * Input.get_axis("move_down", "move_up") * PUSH_SPEED
	var strafe = Vector2.from_angle(rotation + PI_HALF) * Input.get_axis("move_left", "move_right") * STRAFE_SPEED
	velocity = push + strafe

	move_and_slide()
