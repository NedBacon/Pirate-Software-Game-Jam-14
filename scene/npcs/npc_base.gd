extends CharacterBody2D

var player_in_chat_area = false

func start_chat():
	pass

func _on_interaction_body_entered(_body):
	print("player in range")
	player_in_chat_area = true

func _on_interaction_body_exited(_body):
	print("player not in range")
	player_in_chat_area = false
