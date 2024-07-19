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


#func _physics_process(delta):
	##if player_in_area == true:
		##$AudioStreamPlayer2D.play()

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		body.can_interact = true
		body.current_box = self
		player_in_area = true
		print("entrou")

func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		body.can_interact = false
		body.current_box = null
		print("saiu")
		
func tiagay():
	print("tiagomamou")
	$AudioStreamPlayer2D.play()

