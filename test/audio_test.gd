extends Node2D

var paused_sounds: bool = false

func _input(event):
	if event is InputEventKey:
		## playing example sounds from the list of sounds
		# normal sound
		if event.pressed and event.keycode == KEY_Q:
			AudioManager.play_sound("test_click", global_position)
		# sound with variable pitch and volume
		if event.pressed and event.keycode == KEY_W:
			AudioManager.play_sound("test_effect", global_position)
		# sound with variable pitch created from resource
		if event.pressed and event.keycode == KEY_E:
			AudioManager.play_sound("test_example_resource", global_position)
			
		## stopping and resuming sounds
		if event.pressed and event.keycode == KEY_P:
			if paused_sounds: AudioManager.resume_all_sounds()
			else: AudioManager.stop_all_sounds()
			paused_sounds = !paused_sounds
			
		## removing all sounds in play
		if event.pressed and event.keycode == KEY_A:
			AudioManager.remove_all_sounds()
