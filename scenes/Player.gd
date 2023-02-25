extends CharacterBody2D

const PI_QUART: float = PI / 4.0
const PI_HALF: float = PI / 2.0

const PUSH_SPEED: float = 200.0
const STRAFE_SPEED: float = 100.0
const ROT_SPEED: float = 1.0


func init(_position: Vector2):
	position = _position


# Return updated value for src_rotation in order to rotate src towards
# dst, but at most by abs(rot_max) amount in either positive or
# negative direction.
#
# TODO: Have a rotational velocity and acceleration instead of always
# just using contstant speed. Should feel much more natural.
func rotation_towards(
	src_position: Vector2, src_rotation: float, dst_position: Vector2, rot_max: float
) -> float:
	var rotation_uvec: Vector2 = Vector2.from_angle(src_rotation)
	var direction_to_pointer_uvec: Vector2 = (dst_position - src_position).normalized()
	var remaining_rotation: float = rotation_uvec.angle_to(direction_to_pointer_uvec)
	var rot_sign: float = signf(remaining_rotation)
	var rot: float = min(abs(remaining_rotation), abs(rot_max))
	return src_rotation + rot_sign * rot


func _physics_process(delta: float):
	rotation = rotation_towards(
		position, rotation, get_viewport().get_mouse_position(), delta * ROT_SPEED
	)

	var push = Vector2.from_angle(rotation) * Input.get_axis("move_down", "move_up") * PUSH_SPEED
	var strafe = (
		Vector2.from_angle(rotation + PI_HALF)
		* Input.get_axis("move_left", "move_right")
		* STRAFE_SPEED
	)

	# TODO: Maybe include some acceleration by modifying velocity
	# instead of just overriding it.
	velocity = push + strafe

	move_and_slide()
