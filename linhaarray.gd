extends Line2D

# Nodes referenciados na cena
@onready var linhaarray = $"."
@onready var ray_cast_2d = $RayCast2D
@onready var player = $"../player"

# Variáveis usadas para armazenar o estado do jogo
var dicionario = {} # Dicionário para armazenar as posições globais das caixas
var caixa_atual : int # Identificador da caixa atual
var ordem_de_inserção : Array = [] # Array para manter a ordem de inserção das caixas
var ultima_chave = 0 # Última chave usada (não está sendo usada diretamente)

# Função chamada quando o node é inicializado
func _ready():
	# Conecta sinais de VariaveisGlobais a funções específicas
	VariaveisGlobais.id_caixa.connect(receber_ID_da_caixa)
	VariaveisGlobais.caixa_ativada.connect(posição_caixa_ativa)

# Função chamada quando o ID de uma caixa é recebido
func receber_ID_da_caixa(id_caixa):
	caixa_atual = id_caixa # Atualiza a caixa atual com o ID recebido
	print("a caixa atual é ", caixa_atual) # Imprime o ID da caixa atual para debug

# Função para pegar a última inserção no dicionário
func pegar_ultima_inserção():
	if ordem_de_inserção.size() == 0: # Verifica se não há inserções
		return # Se não houver, retorna nada
	var chave = ordem_de_inserção[ordem_de_inserção.size() - 1] # Pega a última chave inserida
	return {chave: dicionario[chave]} # Retorna um dicionário com a última chave e sua posição

# Função chamada quando uma caixa é ativada (clicada)
func posição_caixa_ativa(caixa_ativada):
	var caixa_id = caixa_atual # Identificador da caixa atual
	if dicionario.has(caixa_id): # Verifica se a caixa já está no dicionário
		var chave = ordem_de_inserção[ordem_de_inserção.size() - 1] # Pega a última chave inserida
		if caixa_id == chave: # Verifica se a caixa atual é a última inserida
			ordem_de_inserção.pop_back() # Remove a última entrada do array de ordem de inserção
			dicionario.erase(chave) # Remove a última entrada do dicionário
			linhaarray.remove_point(linhaarray.get_point_count() - 1) # Remove o último ponto da Line2D
			print(dicionario) # Imprime o estado do dicionário para debug
			print("a chave ", chave, " foi removida") # Imprime a chave removida para debug
		return
	dicionario[caixa_id] = caixa_ativada # Adiciona a nova caixa ao dicionário com sua posição
	ordem_de_inserção.append(caixa_id) # Adiciona a caixa atual à ordem de inserção
	print(ordem_de_inserção) # Imprime a ordem de inserção para debug

	linhaarray.add_point(Vector2(0, 0)) # Adiciona um novo ponto à Line2D
	for key in dicionario.keys(): # Para cada chave no dicionário
		linhaarray.set_point_position(linhaarray.get_point_count() - 1, dicionario[key] - global_position) # Atualiza a posição do ponto na Line2D
	print(dicionario) # Imprime o estado do dicionário para debug

# Função chamada a cada frame
func _process(_delta):
	if Input.is_action_just_pressed("sair"): # Verifica se a ação "sair" foi pressionada
		dicionario = {} # Reseta o dicionário
		ordem_de_inserção = [] # Reseta a ordem de inserção
		caixa_atual = 0 # Reseta a caixa atual
		linhaarray.clear_points() # Limpa todos os pontos da Line2D
