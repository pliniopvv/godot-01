extends KinematicBody2D

var velocity := 16

func _ready():
	pass # Replace with function body.


func _process(delta):
	check_sprite_dir()
	check_mov_player()


func check_sprite_dir():
	if Input.is_action_just_pressed("ui_up"):
		$anim.play("Idle_up")
	if Input.is_action_just_pressed("ui_down"):
		$anim.play("Idle_down")
	if Input.is_action_just_pressed("ui_left"):
		$anim.play("Idle_left")
	if Input.is_action_just_pressed("ui_right"):
		$anim.play("Idle_right")

func check_mov_player():
	if Input.is_action_just_pressed("ui_up"):
		if ($".".position.y >= 32):
			$".".position.y -= 16
	if Input.is_action_just_pressed("ui_down"):
		if ($".".position.y <= 16*38):
			$".".position.y += 16
	if Input.is_action_just_pressed("ui_left"):
		if ($".".position.x >= 32):
			$".".position.x -= 16
	if Input.is_action_just_pressed("ui_right"):
		if ($".".position.x <= 16*48):
			$".".position.x += 16
	pass
