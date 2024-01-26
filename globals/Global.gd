extends Node

var is_chatting = false

var trust_level:int = 0
var time_to_spell:float = 190.0
var silence_level:int = 1

# will be used as the quest completion in the messenger, but may be useful elsewhere
var won_game : bool = false

func enter_dialogue() :
	
	is_chatting = true
	
func exit_dialogue(trust_mod : int, time_mod : float):
	
	dialogue_buffer()
	
	# so far trust modifier is always positive, time modifier is always negative
	trust_level += trust_mod
	time_to_spell += time_mod
	
	print("Trust level changed to: %s." % trust_level)
	print("Time left changed to: %s minutes." % time_to_spell)
	
	# timer checks
	if(time_to_spell < 190.0) :
		unlock_tutorial()
	elif(time_to_spell >= 120.0) :
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(
			1
		))
	elif(time_to_spell > 60.0) :
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(
			((time_to_spell * 0.7) - 0.4)
		))
	elif(time_to_spell >= 0) :
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(
			(time_to_spell * 0.3)
		))
	
	# trust checks
	if(trust_level >= 25) :
		won_game = true
		
# prevents the game from locking
func dialogue_buffer() :
	var times_up = get_tree().create_timer(0.1).timeout
	await(times_up)
	is_chatting = false

func unlock_tutorial() :
	pass
	# move the messenger, move vadomere, delete invisible walls
