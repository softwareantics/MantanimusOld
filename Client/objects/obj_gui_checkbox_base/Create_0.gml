/// @description Initialize default parameters.

/// @description Represents the standard text color of a checkbox label.
#macro c_checkbox_text make_color_rgb(227, 134, 20)

event_inherited();

depth -= 1;

/// @description Indicates whether the checkbox is checked.
checked = false;

/// @description The horizontal alignment of the checkbox label.
text.halign = fa_left;

/// @description The font of the checkbox label.
text.font = fnt_gui_checkbox;

/// @description The color of the checkbox label.
text.color = c_checkbox_text;

register_event(gui_event_type.mouse_left_release, function()
{
    checked = !checked;
    image_index = checked;
});