extends CharacterBody2D

const SPEED = 100.0
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
var input_direction : Vector2 = Vector2.ZERO
var last_direction : int

func _physics_process(delta):
	# Handle jump.
	# Input.is_action_just_pressed("ui_accept")

	#move_and_slide()
	#Get Input directon
	# input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	# Update velocity
	velocity = input_direction * SPEED
	
	# Move and Slide function uses velicoty of charcter body to move character on map
	move_and_slide()
	update_animation()
	
func update_animation():
	if input_direction.x != 0 || input_direction.y != 0:
		update_facing_direction()
	else:
		if last_direction == 0:
			animated_sprite.play("Idle")
		elif last_direction == 1:
			animated_sprite.play("Idle_Side")
		else:
			animated_sprite.play("Idle_Up")

func update_facing_direction():
	if input_direction.x < 0:
		animated_sprite.flip_h = true
		animated_sprite.play("Walk_Side")
		last_direction = 1
	elif input_direction.x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("Walk_Side")
		last_direction = 1
	elif input_direction.y > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("Walk_Down")
		last_direction = 0
	else: #input_direction.y < 0:
		animated_sprite.flip_h = false
		animated_sprite.play("Walk_Up")
		last_direction = 2
