/// @description Shorthand for validating if a variable data type is a {gui_text}.
#macro gui_text_t nameof_mf0 "gui_text" nameof_mf1

/// @constructor
/// @description Represents the text and it's relevant data that can be displayed by a GUI control.
/// @argument {gui_text|null} _initial The initial state of this {gui_text} - pass {null} to use the default state.
function gui_text(_initial) constructor
{
    /// @member The actual text that is displayed.
    data = _initial != null ? _initial.data : string_empty;
    
    /// @member The horizontal offset of the text, excluding the controls origin.
    offset_x = _initial != null ? _initial.offset_x : 0;
    
    /// @member The vertical offset of the text, excluding the controls origin.
    offset_y = _initial != null ? _initial.offset_y : 0;
    
    /// @member The horizontal alignment of the text.
    halign = _initial != null ? _initial.halign : fa_center;
    
    /// @member The vertical alignment of the text.
    valign = _initial != null ? _initial.valign : fa_middle;
    
    /// @member The font used when drawing the text to the control.
    font = _initial != null ? _initial.font : fnt_consolas;
    
    /// @member The color used when drawing the text to the control.
    color = _initial != null ? _initial.color : c_white;
    
    /// @member The color used when drawing the text shadow to the control.
    shadow_color = _initial != null ? _initial.shadow_color : c_black;
    
    /// @member The horizontal and vertical offset (in pixels) of the shadow.
    shadow_offset = _initial != null ? _initial.shadow_offset : 4;
    
    /// @member Determines whether the text shadow is drawn to the control.
    shadow_enabled = _initial != null ? _initial.shadow_enabled : false;
}