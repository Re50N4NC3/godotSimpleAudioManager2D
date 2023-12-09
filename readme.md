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
- 'play_sound(sound_name: String, position: Vector2) -> void' 
- 'resume_all_sounds()' 

### Test scene
To test and showcase functionality of the manager, run default scene (`test_scene.tscn`). 
Keybinds:
- Q - plays example sound
- W - plays sound with variable pitch and volume
- E - plays sound with variable pitch and volume (sound created from Resource)
- P - pauses/resumes all sounds
- A - removes all sounds

### Todo
- Between scene persistence
- Music player
    - Crossfading (general dynamic music control)
