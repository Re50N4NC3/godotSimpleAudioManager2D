extends Resource
class_name ComponentSoundResource

@export var sound_name: String
@export var sound_file: AudioStreamMP3

@export_range(-80, 24) var volume_change_min: float
@export_range(-80, 24) var volume_change_max: float

@export_range(0,4) var pitch_scale_min: float = 1
@export_range(0,4) var pitch_scale_max: float = 1

@export var max_distance: int = 2000
@export var area_mask: int = 1
