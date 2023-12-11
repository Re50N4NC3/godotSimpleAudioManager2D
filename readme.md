## Godot 2D audio manager
### Capabilities
- Creation of sound resources
- Playing effects even after calling scene is removed
- Stopping/Playing from stopped point of all effects
- Removal of all effects

### Setup
#### Creating Audio Manager
0. Clone this repo or download as a zip
0. Copy directory `audio_manager` to your project
0. [Create singleton (autoload)](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html#autoload) using `audio_manager.tscn` 
0. Call manager functions inside your scenes (check example code in `/test/audio_test.gd`)

#### Creating sound resource
#### Resource variables
- `Sound Name` - name of the sound that will be referenced in function calls
- `Volumne Change Min` - Minimal __change__ in dB that sound can randomly play at
- `Volumne Change Max` - Maximum __change__ in dB that sound can randomly play at
- `Pitch Scale Min` - Minimum pitch that sound can randomly play at, described as sample rate multiplier
- `Pitch Scale Max` - Maximum pitch that sound can randomly play at, described as sample rate multiplier
- `Max Distance` - Maximum distance from which sound can be heard at in px
- `Area Mask` - Integer, determines `area_mask` layer, for better explanation check [documentation](https://docs.godotengine.org/en/stable/classes/class_audiostreamplayer2d.html#class-audiostreamplayer2d-property-area-mask)

##### Directly in list
0. Go to [audio_manager/audio_manager.tscn](audio_manager/audio_manager.tscn) and `AudioManager` Node inside the scene
0. In inspector under `Sound Resource List` tab click `+Add Element`
0. Click on `<empty>` and pick `New ComponentSoundResource` from the dropdown
0. Click on newly created `ComponentSoundResource` to edit it's values, changes to at least `SoundName` and `SoundFile` are necessary.

##### As a Godot resource
0. In desired location under `FileSystem` tab right click -> `Create new` -> `Resource...`
0. Search for `ComponentSoundResource` and pick it
0. Select save location
0. Select created resource in `FileSystem`
0. In `Inspector` tab edit desired values, changes to at least `SoundName` and `SoundFile` are necessary
0. Go to [audio_manager/audio_manager.tscn](audio_manager/audio_manager.tscn) and `AudioManager` Node inside the scene
0. In inspector under `Sound Resource List` tab click `+Add Element`
0. Click on `<empty>` and pick `QuickLoad` or `Load` from the dropdown
0. Select created Resource.

Example resource: [test\resources\example_sound_resource.tres](test\resources\example_sound_resource.tres)

Remember, resource file name is not used in function call but rather name that you put in `SoundName` variable.

This is recommended way, sounds created as resource are more easily reused between projects and more "safe" as for example small changes related to list code won't remove all created sounds.

### Methods
All methods are inside [audio_manager/audio_manager.tscn](audio_manager/audio_manager.tscn).
#### `play_sound(sound_name: String, position: Vector2) -> void` 
Finds a sound with name `sound_name` and plays it from 2D `position`. If sound is not found debug message is displayed in console but no error is thrown. 

#### `stop_all_sounds() -> void` 
Stops all sounds that are currently playing, new sounds played after this method call are not stopped.

#### `resume_all_sounds() -> void` 
Resumes all sounds.

#### `remove_all_sounds() -> void` 
All created sounds, even stopped, are removed.

### Test scene
To test and showcase functionality of the manager, run default scene (`test_scene.tscn`). 
Keybinds:
- Q - plays example sound
- W - plays example sound with variable pitch and volume
- E - plays example sound with variable pitch and volume (sound created from Resource)
- P - pauses/resumes all sounds
- A - removes all sounds

### Todo
- Between scene persistence
- Delayed/stopped in `play_sound`
- Music player
    - Crossfading (general dynamic music control)
