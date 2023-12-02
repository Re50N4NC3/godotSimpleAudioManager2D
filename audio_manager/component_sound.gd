extends Node
class_name ComponentSound

@export var stream_effect: AudioStreamPlayer2D
@export var sound: AudioStreamMP3

func _ready():
	stream_effect.stream = sound
	stream_effect.play()
	stream_effect.finished.connect(remove_stream)
	
func remove_stream():
	queue_free()
