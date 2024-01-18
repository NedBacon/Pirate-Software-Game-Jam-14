extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_meta("Idle"):
		#texture.set("resource_path","res://MC_Idle.png")
		flip_h = false
		hframes = 2
		vframes = 3
		frame = 0
	else :
		if get_meta("Direction").y == 1:
			hframes = 2
			vframes = 3
			frame = 2
			flip_h = true
		if get_meta("Direction").y == -1:
			hframes = 2
			vframes = 3
			frame = 2
			flip_h = false
		if get_meta("Direction").x == 1:
			hframes = 2
			vframes = 3
			frame = 0
			flip_h = false
		if get_meta("Direction").x == -1:
			hframes = 2
			vframes = 3
			frame = 4
			flip_h = false
		#texture.set("resource_path","res://MC_Idle.png")
	pass
