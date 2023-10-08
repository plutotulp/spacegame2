extends Node2D

func _on_world_box_body_shape_exited(_body_rid, body, _body_shape_index, _local_shape_index):
	# All bodies moving about here must know what to do when they leave the world area
	print("A body shape existed the world")
	body.on_exit_world()

func _on_ship_died():
	print("Ship died!")

func _on_world_box_body_exited(body):
	# All bodies moving about here must know what to do when they leave the world area
	body.on_exit_world()
