/// @description Initialize default parameters.

/// @description Represents the standard text color of a title.
#macro c_title make_color_rgb(227, 134, 20)

event_inherited();

depth -= 1;

/// @description The font of the title.
text.font = fnt_gui_title;

/// @description The font color of the title.
text.color = c_title;

/// @description Determines whether the text shadow is drawn to the title.
text.shadow_enabled = true;