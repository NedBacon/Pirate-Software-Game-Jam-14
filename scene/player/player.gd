extends CharacterBody2D

const SPEED = 100.0
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
var input_direction : Vector2 = Vector2.ZERO
var last_direction : int
var is_chatting = false

func _physics_process(_delta):
	#Get Input directon
	input_direction = Input.get_vector("left", "right", "up", "down")
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

