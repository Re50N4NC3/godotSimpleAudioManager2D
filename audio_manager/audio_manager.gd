extends Node

var sound_component: PackedScene = load("res://audio_manager/component_sound_player.tscn")
@export var sounds_resource_list: Array[ComponentSoundResource] = []
var sounds_names: Array[String] = []

func _ready():
	for snd_no in range(0, sounds_resource_list.size()):
		sounds_names.append(sounds_resource_list[snd_no].sound_name)

func play_sound(sound_name: String, position: Vector2):
	var sound_position = _find_sound_resource_position(sound_name)
	
	if sound_position != -1:
		var sound_to_play: AudioStreamMP3 = sounds_resource_list[sound_position].sound_file
		var snd: ComponentSoundPlayer = sound_component.instantiate()
		
		snd.global_position = position
		snd.sound_file = sound_to_play
		snd.volume_change_range = Vector2(sounds_resource_list[sound_position].volume_change_min, 
										  sounds_resource_list[sound_position].volume_change_max)
		
		get_parent().add_child.call_deferred(snd)
	else:
		print("Couldn't find sound with called name `" + sound_name + "` in Sounds List")

func _find_sound_resource_position(sound_name: String) -> int:
	if sound_name in sounds_names:
		var sound_position: int = sounds_names.find(sound_name, 0)
		return sound_position
	return -1

func stop_all_sounds():
	pass

func resume_all_sounds():
	pass
	
func remove_all_sounds():
	pass
