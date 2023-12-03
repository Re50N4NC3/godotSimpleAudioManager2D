extends Node

var sound_component: PackedScene = load("res://audio_manager/component_sound_player.tscn")
@export var sounds_list: Array[ComponentSoundResource] = []
var sounds_names: Array[String] = []

func _ready():
	for snd_no in range(0, sounds_list.size()):
		sounds_names.append(sounds_list[snd_no].sound_name)

func play_sound(sound_name: String, position: Vector2):
	var sound_to_play: AudioStreamMP3 = find_sound_resource(sound_name)
	
	if sound_to_play != null:
		var snd: ComponentSoundPlayer = sound_component.instantiate()
		snd.global_position = position
		snd.sound_file = sound_to_play
		get_parent().add_child.call_deferred(snd)
	else:
		print("Couldn't find sound with name " + sound_name + " in Sounds List")

func find_sound_resource(sound_name: String) -> AudioStreamMP3:
	if sound_name in sounds_names:
		return sounds_list[sounds_names.find(sound_name, 0)].sound_file
	return null
