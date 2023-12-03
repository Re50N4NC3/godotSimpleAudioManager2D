extends Node2D
class_name ComponentSoundPlayer

var audio_player: AudioStreamPlayer2D
var sound_file: AudioStreamMP3

func _ready():
	audio_player = get_node("AudioPlayer")
	audio_player.stream = sound_file
	audio_player.play()
	audio_player.finished.connect(remove_stream)
	
func remove_stream():
	queue_free()
