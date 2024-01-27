extends CharacterBody2D
class_name Player

const SPEED = 100.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var facing_direction = $Direction
@onready var interaction_finder = $Direction/Interaction

var input_direction : Vector2 = Vector2.ZERO
var last_direction : int

func _physics_process(_delta):
	print(Global.trust_level)
	#Get Input directon
	if !Global.is_chatting:
		input_direction = Input.get_vector("left", "right", "up", "down")
		velocity = input_direction * SPEED
	else :
		velocity = Vector2(0, 0)
	# Move and Slide function uses velicoty of charcter body to move character on map
	move_and_slide()
	update_animation()
	start_chat()
	
func update_animation():
	if((input_direction.x == 0 && input_direction.y == 0) || Global.is_chatting) :
		if last_direction == 0:
			animated_sprite.play("Idle")
		elif last_direction == 1:
			animated_sprite.play("Idle_Side")
		else:
			animated_sprite.play("Idle_Up")
	else:
		update_facing_direction()

func update_facing_direction():
	if input_direction.x < 0:
		animated_sprite.flip_h = true
		animated_sprite.play("Walk_Side")
		facing_direction.rotation = rad_to_deg(-90.0)
		last_direction = 1
		
	elif input_direction.x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("Walk_Side")
		facing_direction.rotation = rad_to_deg(90.0)
		last_direction = 1
		
	elif input_direction.y > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("Walk_Down")
		facing_direction.rotation = rad_to_deg(0.0)
		last_direction = 0
		
	else: 
		animated_sprite.flip_h = false
		animated_sprite.play("Walk_Up")
		facing_direction.rotation = rad_to_deg(180.0)
		last_direction = 2

func start_chat():
	if !Global.is_chatting:
		var interactable = interaction_finder.get_overlapping_areas()
		if Input.is_action_just_pressed("interaction") && interactable.size() > 0:
			Global.enter_dialogue()
			interactable[0].action()
			return
