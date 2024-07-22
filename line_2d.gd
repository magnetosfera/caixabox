extends Line2D
@onready var line2d = $"."
var positioncaixaatual : Vector2
var positioncaixa1 : Vector2
var positioncaixa2 : Vector2
var positioncaixa3 : Vector2
@onready var player = $"../player"
var caixasativas = 0
var caixa1 = false
var caixa2 = false
var caixa3 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	VariaveisGlobais.caixa_ativada.connect(posição_caixa_ativa)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("sair"):
		caixasativas = 0
		line2d.set_point_position(0,Vector2(0,0))
		line2d.set_point_position(1,Vector2(0,0))
		line2d.set_point_position(2, Vector2(0,0))
	if caixasativas == 0:
		line2d.set_point_position(0,Vector2(0,0))
		line2d.set_point_position(1,Vector2(0,0))
		line2d.set_point_position(2, Vector2(0,0))
	if caixasativas == 1:
		positioncaixa1 = positioncaixaatual
		line2d.set_point_position(0, (positioncaixa1 - global_position))
		line2d.set_point_position(1, (positioncaixa1 - global_position))
		line2d.set_point_position(2, (positioncaixa1 - global_position))
	if caixasativas == 2:
		positioncaixa2 = positioncaixaatual
		line2d.set_point_position(0, (positioncaixa1 - global_position))
		line2d.set_point_position(1, (positioncaixa2 - global_position))
		line2d.set_point_position(2, (positioncaixa2 - global_position))
	if caixasativas == 3:
		positioncaixa3 = positioncaixaatual
		line2d.set_point_position(0, (positioncaixa1 - global_position))
		line2d.set_point_position(1, (positioncaixa2 - global_position))
		line2d.set_point_position(2, (positioncaixa3 - global_position))
	

func posição_caixa_ativa(caixa_ativada):
	positioncaixaatual = caixa_ativada
	caixasativas += 1
	print(caixasativas)
