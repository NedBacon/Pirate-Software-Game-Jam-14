extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta):
	# Handle jump.
	# Input.is_action_just_pressed("ui_accept")

	#move_and_slide()
	#Get Input directon
	var input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	if input_direction.orthogonal() != Vector2(0,0):
		#get_child(1,true).set("Texture2D","res://.godot/imported/MC_Idle.png-d5915bc8ca3304f7370c1fa6ac693c0f.ctex")
		get_child(1,false).set_meta("Idle",false)
		get_child(1,false).set_meta("Direction",input_direction.orthogonal())
	else:
		get_child(1,false).set_meta("Idle",true)
		get_child(1,false).set_meta("Direction",Vector2(0,0))
	
	# Update velocity
	velocity = input_direction * SPEED
	
	# Move and Slide function uses velicoty of charcter body to move character on map
	move_and_slide()
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body := collision.get_collider()
		print("Collided with: ", body.name)
