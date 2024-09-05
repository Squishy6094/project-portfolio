extends CharacterBody2D


@export var SPEED = 100
@export var ACCEL = 5

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("player_left", "player_right")
	var directionY := Input.get_axis("player_up", "player_down")
	if directionX:
		velocity.x = clamp(velocity.x + (directionX * ACCEL), -SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED*0.1)

	if directionY:
		velocity.y = clamp(velocity.y + (directionY * ACCEL), -SPEED, SPEED)
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED*0.1)

	move_and_slide()
