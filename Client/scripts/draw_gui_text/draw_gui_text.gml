/// @function draw_gui_text(_text, _x, _y).
/// @description Draws the specified {_text} at the specifide {_x} and {_y} coordinates.
/// @argument {gui_text} _text The GUI textual information to be drawn.
/// @argument {number} _x The x coordinate to draw the specified {gui_text}.
/// @argument {number} _y The y coordinate to draw the specified {gui_text}.
/// @exception {argument_null_exception} The specified {_text}, {_x} or {_y} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_text} parameter must be of type {gui_text}.
/// @exception {argument_invalid_type_exception} The specified {_x} or {_y} parameter must be of type {number}.
function draw_gui_text(_text, _x, _y)
{
    validate_mf0 _text validate_mf1 "_text" validate_mf2  gui_text_t validate_mf3;
    validate_mf0 _x validate_mf1 "_x" validate_mf2  number_t validate_mf3;
    validate_mf0 _y validate_mf1 "_y" validate_mf2  number_t validate_mf3;
    
    draw_set_font(_text.font);
    
    draw_set_valign(_text.valign);
    draw_set_halign(_text.halign);
    
    var _xx = x + _text.offset_x;
    var _yy = y + _text.offset_y;
    
    if (_text.shadow_enabled)
    {
        draw_set_color(_text.shadow_color);
            
        for (var i = 0; i < _text.shadow_offset; i++)
        {
            draw_text(_xx + i, _yy + i, _text.data);
        }
    }
    
    draw_set_color(_text.color);
    draw_text(_xx, _yy, _text.data);
}