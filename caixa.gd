extends Area2D
class_name Caixa

@export var sound_file: AudioStreamPlayer2D
var player_in_area = false
@export var box_id: int # ID da caixa

func _ready():
	if not is_connected("body_entered", Callable (self, "_on_body_entered")):
		connect("body_entered", Callable (self, "_on_body_entered"))
	if not is_connected("body_exited", Callable (self, "_on_body_exited")):
		connect("body_exited", Callable (self, "_on_body_exited"))

func _physics_process(delta):
	if player_in_area == true and Input.is_action_just_pressed("conexão"):
		VariaveisGlobais.emit_signal("caixa_ativada", position)
		print ("ativou")

func _on_body_entered(body):
	if body.name == "player":
		body.can_interact = true
		body.current_box = self
		player_in_area = true
		print("entrou")

func _on_body_exited(body):
	if body.name == "player":
		body.can_interact = false
		body.current_box = null
		player_in_area = false
		print("saiu")

func posição_caixa(caixa_ativada):
	global_position = caixa_ativada
	
	

