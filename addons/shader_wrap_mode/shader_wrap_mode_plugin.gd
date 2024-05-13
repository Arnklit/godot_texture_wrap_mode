@tool
extends EditorPlugin

const ShaderInspector = preload("res://addons/shader_wrap_mode/shader_inspector.gd")
var plugin: EditorInspectorPlugin = ShaderInspector.new()


func _enter_tree() -> void:
	add_inspector_plugin(plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(plugin)
