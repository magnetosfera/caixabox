extends Line2D
@onready var line2d = $"."
var positioncaixa1 : Vector2
var positioncaixa2 : Vector2
@onready var player = $"../player"
var caixa1 = false
var caixa2 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	VariaveisGlobais.caixa_ativada.connect(posição_caixa_ativa)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if caixa1 == false and caixa2 == false:
		line2d.set_point_position(0,Vector2(0,0))
		line2d.set_point_position(1,Vector2(0,0))
	if caixa1 == true and caixa2 == false:
		line2d.set_point_position(0, (positioncaixa1 - global_position))
		line2d.set_point_position(1, (player.global_position - global_position))
	if caixa1 == true and caixa2 == true:
		line2d.set_point_position(0, (positioncaixa1 - global_position))
		line2d.set_point_position(1, (positioncaixa2 - global_position))
	

func posição_caixa_ativa(caixa_ativada):
	if caixa1 == false:
		positioncaixa1 = caixa_ativada
		caixa1 = true
	if caixa1 == true:
		positioncaixa2 = caixa_ativada
		caixa2 = true
