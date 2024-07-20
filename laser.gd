extends Node2D

const COMPRIMENTO_MÁXIMO = 2000	

@onready var feixo = $Feixo
@onready var fim = $Fim
@onready var ray_cast_2d = $RayCast2D

func _physics_process(delta):
	var posição_mouse = get_local_mouse_position()
	var max_cast_para = posição_mouse.normalized() * COMPRIMENTO_MÁXIMO
	ray_cast_2d.target_position = max_cast_para
	if ray_cast_2d.is_colliding():
		fim.global_position = ray_cast_2d.get_collision_point()
	else:
		fim.global_position = ray_cast_2d.target_position
	feixo.rotation = ray_cast_2d.target_position.angle()
	feixo.region_rect.end.x = fim.position.length()
