extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	texture.set("resource_path","res://pixel art/MC_F_Walk.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if get_meta("Idle"):
		#
		#set_meta("Frame",0)
	#else :
		#hframes = 6
		#if get_meta("Direction").x == 1:
			#if get_meta("Frame") == 60:
				#set_meta("Frame",0)
			#frame = 0 + (get_meta("Frame")/10)
			#flip_h = false
		#elif get_meta("Direction").x == -1:
			#if get_meta("Frame") == 60:
				#set_meta("Frame",0)
			#frame = 12 + (get_meta("Frame")/10)
			#flip_h = false
		#elif get_meta("Direction").y == 1:
			#if get_meta("Frame") == 60:
				#set_meta("Frame",0)
			#frame = 6 + (get_meta("Frame")/10)
			#flip_h = true
		#elif get_meta("Direction").y == -1:
			#if get_meta("Frame") == 60:
				#set_meta("Frame",0)
			#frame = 6 + (get_meta("Frame")/10)
			#flip_h = false
		#else:
			#set_meta("Frame",-1)
		#set_meta("Frame", get_meta("Frame")+1)
	pass
