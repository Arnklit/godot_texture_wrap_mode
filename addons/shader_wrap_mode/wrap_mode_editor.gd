@tool
extends EditorProperty


var property_control := OptionButton.new()
var current_value := 0

func _init() -> void:
	property_control.add_item("Repeat")
	property_control.add_item("Clamp")
	property_control.add_item("Mirror")
	property_control.add_item("MirrorOnce")
	add_child(property_control)
	add_focusable(property_control)
	property_control.item_selected.connect(_item_selected)


func _update_property() -> void:
	var new_value: int = get_edited_object()[get_edited_property()]
	property_control.selected = new_value
	current_value = new_value


func _item_selected(idx: int) -> void:
	if idx == current_value:
		return
	current_value = idx
	emit_changed(get_edited_property(), current_value)
