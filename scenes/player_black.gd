extends KinematicBody2D

var velocity: Vector2

export(int) var speed

func _ready():
	pass # Replace with function body.


func _process(delta):
	animate()
	move()


func animate():
	if Input.is_action_just_pressed("ui_up"):
		$anim.play("Idle_up")
	if Input.is_action_just_pressed("ui_down"):
		$anim.play("Idle_down")
	if Input.is_action_just_pressed("ui_left"):
		$anim.play("Idle_left")
	if Input.is_action_just_pressed("ui_right"):
		$anim.play("Idle_right")

func move():
	var direction_vector: Vector2 = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	velocity = direction_vector * speed
	velocity = move_and_slide(velocity)
