extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
const JUMP_CANCEL_VELOCITY = 100.0

signal player_died




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("JumpAction") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("JumpAction") and not is_on_floor() and velocity.y < 0:
		velocity.y = JUMP_CANCEL_VELOCITY
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#insert death code here
	player_died.emit()
	pass # Replace with function body.