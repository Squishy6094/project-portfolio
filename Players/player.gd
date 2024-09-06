extends CharacterBody2D

@export var SPEED = 100
@export var ACCEL = 5

var mouse_target = null
# Mouse Input
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			mouse_target = get_global_mouse_position()

func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	if mouse_target == null:
		velocity = input_direction * SPEED
	else:
		velocity = position.direction_to(mouse_target) * SPEED
		if position.distance_to(mouse_target) < 10 || input_direction:
			mouse_target = null


	

	move_and_slide()
