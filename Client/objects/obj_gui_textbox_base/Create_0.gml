/// @description Initialize default parameters.

/// @description Represents the standard text color of a textbox label.
#macro c_textbox_label c_gray

/// @description Represents the standard text color of the contents of a textbox.
#macro c_textbox_text c_white

event_inherited();

depth -= 1;

/// @description Enumerates the available textbox states for regular expression matching.
enum textbox_state
{
    /// @description The textbox is in it's default state.
    standard = 0,
    
    /// @description The textbox is in a valid state, meaning the regular expression was matched.
    valid = 1,
    
    /// @description The textbox is in an invalid state, meaning the regular expression wasn't matched.
    invalid = 2,
}

/// @description The font used when drawing the contents to the textbox.
text.font = fnt_gui_textbox;

/// @description The horizontal alignment used when drawing the contents to the textbox.
text.halign = fa_left;

/// @description The vertical alignment used when drawing the contents to the textbox.
text.valign = fa_center;

/// @description The color used when drawing the contents to the textbox.
text.color = c_textbox_text;

/// @description The {gui_text} used when drawing the label to the textbox.
label = new gui_text(null);

/// @description The default label text.
label.text = "Label: ";

/// @description The horizontal offset of the label, excluding the controls origin.
label.offset_x = -sprite_xoffset * 2;

/// @description The horizontal alignment used when drawing the label to the textbox.
label.halign = fa_right;

/// @description The vertical alignment used when drawing the label to the textbox.
label.valign = fa_middle;

/// @description The font used when drawing the label to the textbox.
label.font = fnt_gui_label;

/// @description The color used when drawing the label to the textbox.
label.color = c_textbox_label;

/// @description The user input string, this is what the user has typed into the textbox.
input = string_empty;

/// @description The amount time that will pass before the caret character can be displayed.
caret_blink_time = 0.5 * game_get_speed(gamespeed_fps);

/// @description The caret character to be displayed when blinking or typing.
caret_character = "|";

/// @description Indicates whether the caret character is blinking.
caret_blink = false;

/// @description The amount of time that will pass before characters can be deleted when the backspace key is held down.
back_wait_time = 0.5 * game_get_speed(gamespeed_fps);

/// @description The amount of time that will pass between deleting individual characters when the backspace key is held down.
back_delete_time = 0.05 * game_get_speed(gamespeed_fps);

/// @description The maximum number of character s that can be entered into the textbox control, -1 for unlimited.
max_characters = -1;

/// @description The width (in pixels) that determines when the textbox control will begin to scroll text.
scroll_width = sprite_width - (sprite_xoffset * 3);

/// @description Indicates whether the textbox contents are hidden.
hide_characters = false;

/// @description The character to show in place of the contents when {hide_characters} is true.
hidden_character = "*";

/// @description The regular expression pattern to use when {use_regex} is true.
regex_pattern = string_empty;

/// @description Indicates whether the textbox control should be match against {regex_pattern}.
use_regex = false;

register_event(gui_event_type.got_focus, function()
{
    caret_blink = true;
    alarm[1] = caret_blink_time;
});

matches_regex = function()
{
    if (!use_regex)
    {
        return false;
    }
    
    return regex(input, regex_pattern);
}

focus_on_invalid_regex = function()
{
    if (!matches_regex())
    {
        set_focus(true);
        
        return true;
    }
    
    return false;
}