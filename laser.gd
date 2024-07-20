extends Node2D

const MAX_LENGHT = 2000

@onready var facho = $facho
@onready var final = $final
@onready var raycast2d = $RayCast2D

func _physics_process(delta):
	var mouse_position = get_local_mouse_position()
	var max_cast_to = mouse_position.normalized() * MAX_LENGHT
	raycast2d.target_position = max_cast_to
	if raycast2d.is_colliding():
		final.global_position = raycast2d.get_collision_point()
	else:
		final.global_position = raycast2d.target_position
	
	facho.rotation = raycast2d.target_position.angle()
	facho.region_rect.end.x = final.position.length()
	
