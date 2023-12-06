extends Node

var sound_component: PackedScene = load("res://audio_manager/component_sound_player.tscn")
@export var sounds_resource_list: Array[ComponentSoundResource] = []
var sounds_names: Array[String] = []

func _ready():
	for snd_no in range(0, sounds_resource_list.size()):
		sounds_names.append(sounds_resource_list[snd_no].sound_name)

func play_sound(sound_name: String, position: Vector2) -> void:
	var sound_position_in_array = _find_sound_resource_position(sound_name)
	
	if sound_position_in_array != -1:
		var sound_to_play: AudioStreamMP3 = sounds_resource_list[sound_position_in_array].sound_file
		var snd: ComponentSoundPlayer = sound_component.instantiate()
		
		snd.global_position = position
		snd.sound_file = sound_to_play
		_setup_other_sound_values(snd, sound_position_in_array)
		
		snd.add_to_group("sounds")
		
		get_parent().add_child.call_deferred(snd)
	else:
		print("Couldn't find sound with called name `" + sound_name + "` in Sounds List")

func _find_sound_resource_position(sound_name: String) -> int:
	if sound_name in sounds_names:
		var sound_position_in_array: int = sounds_names.find(sound_name, 0)
		return sound_position_in_array
	return -1
	
func _setup_other_sound_values(snd: ComponentSoundPlayer, sound_position_in_array: int) -> void:
	snd.volume_change_range = Vector2(sounds_resource_list[sound_position_in_array].volume_change_min, 
									  sounds_resource_list[sound_position_in_array].volume_change_max)
	snd.pitch_change_range = Vector2(sounds_resource_list[sound_position_in_array].pitch_scale_min, 
									  sounds_resource_list[sound_position_in_array].pitch_scale_max)
	snd.max_distance = sounds_resource_list[sound_position_in_array].max_distance
	snd.area_mask = sounds_resource_list[sound_position_in_array].area_mask

func stop_all_sounds() -> void:
	for sound in get_tree().get_nodes_in_group("sounds"):
		sound.audio_player.stream_paused = true

func resume_all_sounds() -> void:
	for sound in get_tree().get_nodes_in_group("sounds"):
		sound.audio_player.stream_paused = false
	
func remove_all_sounds() -> void:
	pass
