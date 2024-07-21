extends CharacterBody2D
class_name Personagem

@export var speed = 450
var can_interact = false
var current_box = null
var start_box = null

func _physics_process(delta):
	movimento_boneco(delta)
	

func movimento_boneco(delta):
	if Input.is_action_pressed("direita"):
		velocity.x = speed
		velocity.y = 0
		$AnimatedSprite2D.play("anda_direita")
		Globalvar.emitirposição.emit(global_position)
		
	elif Input.is_action_pressed("esquerda"):
		velocity.x = -speed
		velocity.y = 0
		$AnimatedSprite2D.play("anda_esquerda")
		Globalvar.emitirposição.emit(global_position)
	elif Input.is_action_pressed("cima"):
		velocity.y = -speed
		velocity.x = 0
		$AnimatedSprite2D.play("anda_cima")
		Globalvar.emitirposição.emit(global_position)
	elif Input.is_action_pressed("baixo"):
		velocity.y = speed
		velocity.x = 0
		$AnimatedSprite2D.play("anda_baixo")
		Globalvar.emitirposição.emit(global_position)
	else:
		velocity.x = 0
		velocity.y = 0
		$AnimatedSprite2D.play("idle")
		
	if velocity.length() != 0 and $Timer.time_left == 0:
		$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
		$AudioStreamPlayer2D.play()
		$Timer.start()
		
	move_and_slide()
	
	if can_interact and Input.is_action_just_pressed("ação"):
		print("apertouuuuuu")
		print(current_box.box_id)
		if current_box:
			current_box.tiagay()

