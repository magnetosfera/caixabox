extends Node2D

const COMPRIMENTO_MÁXIMO = 2000	

@onready var feixo = $Feixo
@onready var fim = $Fim
@onready var ray_cast_2d = $RayCast2D
@onready var player = $"../player"
var final_laser = null


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ação"):
		final_laser = player.global_position - global_position
		_laser()
	
func _laser(): 
	ray_cast_2d.target_position = final_laser
	if ray_cast_2d.is_colliding():
		fim.global_position = ray_cast_2d.get_collision_point()
	else:
		fim.global_position = player.global_position
	feixo.rotation = ray_cast_2d.target_position.angle()
	feixo.region_rect.end.x = fim.position.length()
