extends Node2D

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_Q:
			AudioManager.play_sound("test_click", global_position)
