extends Node2D
class_name ComponentSoundPlayer

var stream_effect: AudioStreamPlayer2D
var sound_file: AudioStreamMP3

func _ready():
	stream_effect = get_node("AudioPlayer")
	stream_effect.stream = sound_file
	stream_effect.play()
	stream_effect.finished.connect(remove_stream)
	
func remove_stream():
	queue_free()
