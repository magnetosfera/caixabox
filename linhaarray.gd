extends Line2D
@onready var linhaarray = $"."

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
	dicionario[caixa_atual]=caixa_ativada
	linhaarray.add_point(Vector2(0,0))
	for caixa in dicionario:
			linhaarray.set_point_position(get_point_count()-1, (dicionario[caixa] - global_position))
	print (dicionario)


func _process(delta):
	if Input.is_action_just_pressed("sair"):
		dicionario = {}
		caixasdicionario = 0
		linhaarray.clear_points()
