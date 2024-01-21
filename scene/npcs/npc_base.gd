extends CharacterBody2D

var player_in_chat_area = false

@onready var dialogue = $Dialogue

func start_chat():
	if player_in_chat_area and Input.is_action_just_pressed("interaction"):
		dialogue.start()

func _on_interaction_body_entered(_body):
	player_in_chat_area = true

func _on_interaction_body_exited(_body):
	player_in_chat_area = false
