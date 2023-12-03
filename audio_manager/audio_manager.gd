extends Node

var sound_component: PackedScene = load("res://audio_manager/component_sound.gd")
@export var sounds_list: Array[ComponentSoundResource] = []


func play_sound(sound_name: String, position: Vector2):
	var sound_to_play: AudioStreamMP3 = find_sound_resource(sound_name)
	
	if sound_to_play != null:
		var snd: ComponentSoundPlayer = sound_component.instantiate()
		snd.global_position = position
		snd.sound_file = sound_to_play
		snd.get_parent().add_child.call_deferred(snd)
	else:
		print("Couldn't find sound with name " + sound_name + " in Sounds List")

func find_sound_resource(sound_name: String) -> AudioStreamMP3:
	for snd in sounds_list:
		if snd.sound_name == sound_name:
			return snd.sound_file
	return null
