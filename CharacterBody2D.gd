extends CharacterBody2D

const SPEED = 50.0

func _physics_process(delta):
	# Handle jump.
	# Input.is_action_just_pressed("ui_accept")

	move_and_slide()
	#Get Input directon
	var input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	# Update velocity
	velocity = input_direction * SPEED
	
	# Move and Slide function uses velicoty of charcter body to move character on map
	move_and_slide()
