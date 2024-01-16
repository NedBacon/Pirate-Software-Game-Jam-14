extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_key_pressed(KEY_UP)):
		position.y = position.y - 1;
	if(Input.is_key_pressed(KEY_DOWN)):
		position.y = position.y + 1;
	if(Input.is_key_pressed(KEY_LEFT)):
		position.x = position.x - 1;
	if(Input.is_key_pressed(KEY_RIGHT)):
		position.x = position.x + 1;
	pass
