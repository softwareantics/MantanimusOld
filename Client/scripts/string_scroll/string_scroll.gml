/// @function string_scroll(_stirng, _font, _width).
/// @description Scrolls the specified {_string} if the width of the specified {_string} is greater than the specified {_width}.
/// @argument {string} _string The string to scroll.
/// @argument {font} _font The font to use when scrolling.
/// @argument {number} _width The width (in pixels) that defines the maximum value before scrolling.
/// @exception {argument_null_exception} The specified {_string}, {_font} or {_width} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_string} parameter must be of type {string}.
/// @exception {argument_invalid_type_exception} The specified {_font} parameter must be of type {int32}.
/// @exception {argument_invalid_type_exception} The specified {_width} parameter must be of type {number}.
/// @return {string} Returns The scrolled result of {_string} if scrolled; otherwise, {_string}.
function string_scroll(_string, _font, _width)
{
    validate_mf0 _string validate_mf1 "_string" validate_mf2  string_t validate_mf3;
    validate_mf0 _font validate_mf1 "_font" validate_mf2  int32_t validate_mf3;
    validate_mf0 _width validate_mf1 "_width" validate_mf2  number_t validate_mf3;
    
    draw_set_font(_font);
    
    if (string_width(_string) >= _width)
    {
        var _temp = string_empty;
        
        for (var i = string_length(_string); i > 0; i--)
        {
            _temp += string_char_at(_string, i);
            
            if (string_width(_temp) >= _width)
            {
                var _length = string_length(_temp);
                
                return string_copy(_string, string_length(_string) - _length + 1, _length);
            }
        }
    }
    
    return _string;
}