extends Node2D
class_name ComponentSoundPlayer

var audio_player: AudioStreamPlayer2D
var sound_file: AudioStreamMP3
var volume_change_range: Vector2
var pitch_change_range: Vector2
var max_distance: int
var area_mask: int

func _ready():
	audio_player = get_node("AudioPlayer")
	audio_player.stream = sound_file
	audio_player.volume_db = randf_range(volume_change_range[0], volume_change_range[1])
	audio_player.pitch_scale = randf_range(pitch_change_range[0], pitch_change_range[1])
	audio_player.max_distance = max_distance
	audio_player.area_mask = area_mask
	audio_player.play()
	audio_player.finished.connect(remove_stream)
	
func remove_stream():
	remove_from_group("sounds")
	queue_free()
