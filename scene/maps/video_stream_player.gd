extends VideoStreamPlayer

func _ready():
	Global.is_chatting = true
	
func _on_finished():
	Global.is_chatting = false
	$"../BG Music".play()
