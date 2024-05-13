# Texture Wrap Mode
Adds option to control wrap mode as a material parameter for custom shaders.

## Overview

The wrapping mode of a texture is set as a hint on a texture's sampler uniform. This means it's difficult to use the same shader where the only change you want is the wrapping mode of the texture. This shader include and addon gives you a solution for that.

**The same shader and texture used in 4 materials with various wrap modes**
![](https://github.com/Arnklit/godot_texture_wrap_mode/blob/main/screenshots/example.png)

## Usage

```glsl
// Include the .gdshaderinc in any shader you need wrap mode added to
#include "res://addons/shader_wrap_mode/wrap_mode.gdshaderinc"
```

```glsl
// Set repeat mode to enabled with the hint
uniform sampler2D albedo_texture: repeat_enable; 
// Add an int uniform with the same name as your sampler2D, but with "_wrap_mode" appended
uniform int albedo_texture_wrap_mode = 0;
```

```glsl
// Change and "texture" and "textureLod" calls to "textureWrapped" and "textureLodWrapped" and add the wrap_mode value as the last argument.
ALBEDO = textureWrapped(albedo_texture, base_uv, albedo_texture_wrap_mode).rgb;
```

**The addon will then parse the wrap mode uniform and display it as a dropdown in the inspector**
![](https://github.com/Arnklit/godot_texture_wrap_mode/blob/main/screenshots/inspector.png)
