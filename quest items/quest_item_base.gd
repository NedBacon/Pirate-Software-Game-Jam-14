extends Area2D

const Balloon = preload("res://dialogue/small_balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = ""

func _on_body_entered(body):
		action()
		queue_free()

func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
