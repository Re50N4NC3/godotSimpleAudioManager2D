## Godot 2D audio manager
### Capabilities
- Creation of sound resources
- Playing effects even after calling scene is removed
- Stopping/Playing from stopped point of all effects
- Removal of all effects

### Setup
#### Creating Audio Manager

#### Creating sound resource

### Methods
#### `play_sound(sound_name: String, position: Vector2) -> void` 
Finds a sound with name `sound_name` and plays it from 2D `position`. If sound is not found debug message is displayed in console but no error is thrown. 

#### `stop_all_sounds() -> void` 
Stops all sounds that are currently playing, new sounds are not stopped.

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
