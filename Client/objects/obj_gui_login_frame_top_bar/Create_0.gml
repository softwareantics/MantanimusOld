/// @description Initialize default parameters.

event_inherited();

text.data = "AUTHENTICATION";

display_message = function(_message, _color)
{
    validate_mf0 _message validate_mf1 "_message" validate_mf2  string_t validate_mf3;
    validate_mf0 _color validate_mf1 "_color" validate_mf2  int32_t validate_mf3;
    
    text.data = _message;
    text.color = _color;
}