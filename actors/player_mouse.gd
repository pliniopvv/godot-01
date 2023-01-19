extends KinematicBody2D

export var selected = false setget set_selected
export(int) var speed

var velocity: Vector2

signal was_selected
signal was_deselected

func _ready():
	connect("was_selected", get_parent(), "select_unit")
	connect("was_deselected", get_parent(), "deselect_unit")

func _on_unit_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			set_selected(true)
		if event.button_index == BUTTON_RIGHT:
			set_selected(false)

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

func set_selected(value):
	if selected != value:
		selected = value
		$box.visible = value
		if selected:
			emit_signal("was_selected", self)
		else:
			emit_signal("was_deselected", self)
