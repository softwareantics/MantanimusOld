/// @description Initialize default parameters.

/// @description Represents the standard text color of a button.
#macro c_button c_white

event_inherited();

depth -= 1;

/// @description Enumerates the available button states.
enum button_state
{
    /// @description The button is up.
    up = 0,
    
    /// @description The button is down.
    down = 1,
    
    /// @description The mouse is hovering over the button.
    hover = 2,
}

/// @function set_button_state(_state)
/// @description Changes the state of the button.
/// @argument {int64} _state The state to change the button too.
set_button_state = function(_state)
{
    validate_mf0 _state validate_mf1 "_state" validate_mf2  int64_t validate_mf3;
    
    image_index = _state;
    
    switch (_state)
    {
        case button_state.up:
            text.shadow_enabled = true;
            break;
            
        case button_state.down:
            text.shadow_enabled = false;
            break;
        
        case button_state.hover:
            text.shadow_enabled = true;
            break;
    }
    
    state = _state;
}

/// @description The current state of the button.
state = button_state.up;

/// @description The name of the button.
text.data = "Button";

/// @description The font of the button name.
text.font = fnt_gui_button;

/// @description The color of the button name.
text.color = c_button;

/// @description Determines whether the text shadow is drawn to the button name.
text.shadow_enabled = true;

register_event(gui_event_type.lost_focus, function()
{
    set_button_state(button_state.up);
});

register_event(gui_event_type.mouse_left_press, function()
{
    set_button_state(button_state.down);
});

register_event(gui_event_type.mouse_left_release, function()
{
    set_button_state(button_state.hover);
});

register_event(gui_event_type.mouse_enter, function()
{
    set_button_state(button_state.hover);
});

register_event(gui_event_type.mouse_leave, function()
{
    set_button_state(button_state.up);
});