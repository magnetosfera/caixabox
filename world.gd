extends Node

var min_x = 22
var max_x = 1120
var min_y = 72
var max_y = 628

func _physics_process(_delta):
	var player = $player


# FECHAR
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


# CLAMP
	player.position.x = clamp(player.position.x, min_x, max_x)
	player.position.y = clamp(player.position.y, min_y, max_y)
