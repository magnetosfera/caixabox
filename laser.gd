extends Node2D

const COMPRIMENTO_MÁXIMO = 2000	

@onready var feixo = $Feixo
@onready var fim = $Fim
@onready var ray_cast_2d = $RayCast2D
@onready var player = $"../player"
var final_laser : Vector2
var laser_on = false
var caixa1ativa = false
var caixa2ativa = false
var caixa2ativaposição = null

func _ready():
	VariaveisGlobais.caixa_ativada.connect(posição_laser)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ação"):
		laser_on = true
	if Input.is_action_just_pressed("sair"):
		laser_on = false
		caixa1ativa = false
	if laser_on == true:
		final_laser = player.global_position - global_position
		ray_cast_2d.target_position = final_laser
		if ray_cast_2d.is_colliding():
			fim.global_position = ray_cast_2d.get_collision_point()
		feixo.rotation = ray_cast_2d.target_position.angle()
		feixo.region_rect.end.x = fim.position.length()
		
	if laser_on == false:
		feixo.region_rect.end.x = 0
	if Input.is_action_just_pressed("mudarposiçãocaixa"):
		global_position = player.global_position 

func posição_laser(caixa_ativada):
	if caixa1ativa == false:
		global_position = caixa_ativada
