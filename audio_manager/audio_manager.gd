extends Node

var sound_component: PackedScene = load("res://audio_manager/component_sound.gd")
@export var sounds_list: Array[ComponentSoundResource] = []


func play_sound(sound_name: String, position: Vector2):
	var snd = sound_component.instantiate()
	
	snd.global_position = position
	snd.sound = sound_name

	snd.get_parent().add_child.call_deferred(snd)

func find_sound_resource(sound_name: String):
	pass
