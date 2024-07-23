extends Line2D
@onready var linhaarray = $"."
@onready var ray_cast_2d = $RayCast2D
@onready var player = $"../player"

var dicionario = {}
var caixasdicionario = 0
var caixa_atual : int

func _ready():
	VariaveisGlobais.id_caixa.connect(receber_ID_da_caixa)
	VariaveisGlobais.caixa_ativada.connect(posição_caixa_ativa) 
	
func receber_ID_da_caixa(id_caixa):
		caixa_atual = id_caixa
		print("a caixa atual é ", caixa_atual)
	
func posição_caixa_ativa(caixa_ativada):
	if dicionario.has(caixa_atual):
		print("rafagay")
		return
	dicionario[caixa_atual]=caixa_ativada
	linhaarray.add_point(Vector2(0,0))
	for caixa in dicionario:
			linhaarray.set_point_position(get_point_count()-1, (dicionario[caixa] - global_position))
	print (dicionario)

func _process(_delta):
	if dicionario.has(caixa_atual):
		ray_cast_2d.global_position = dicionario[caixa_atual]
		ray_cast_2d.target_position = (player.global_position - dicionario[caixa_atual])
	if Input.is_action_just_pressed("sair"):
		dicionario = {}
		caixasdicionario = 0
		caixa_atual = 0
		linhaarray.clear_points()
