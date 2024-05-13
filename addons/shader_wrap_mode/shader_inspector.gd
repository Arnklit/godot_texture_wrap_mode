@tool
extends EditorInspectorPlugin

var WrapModeEditor = preload("res://addons/shader_wrap_mode/wrap_mode_editor.gd")

var properties := []

func _can_handle(object: Object) -> bool:
	if object is ShaderMaterial:
		return true
	return false


func _parse_property(object: Object, type: Variant.Type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if name.ends_with("_wrap_mode") and type == TYPE_INT:
		properties.append(name)
		return true
	if hint_string == "Texture2D":
		for prop in properties:
			if name + "_wrap_mode" == prop:
				properties.erase(prop)
				add_property_editor(prop, WrapModeEditor.new())
	return false
