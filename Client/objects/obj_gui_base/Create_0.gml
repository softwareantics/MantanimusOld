/// @description Initialize default parameters.

/// @description Represents the highest depth value of all controls excluding containers.
#macro gui_depth -1000

/// @description Enumerates the available event types for GUI controls.
enum gui_event_type
{
    /// @description The control has lost focus.
    lost_focus = 0,

    /// @description The control has gained focus.
    got_focus = 1,
    
    /// @description The left mouse button is held down on the control.
    mouse_left = 2,
    
    /// @description The left mouse button has been pressed on the control.
    mouse_left_press = 3,
    
    /// @description The left mouse button has been released on the control.
    mouse_left_release = 4,
    
    /// @description The right mouse button is held down on the control.
    mouse_right = 5,
    
    /// @description The right mouse button has been pressed on the control.
    mouse_right_press = 6,
    
    /// @description The right mouse button has been released on the control.
    mouse_right_release = 7,

    /// @description The middle mouse button is held down on the control.
    mouse_middle = 8,
    
    /// @description The middle mouse button has been pressed on the control.
    mouse_middle_press = 9,
    
    /// @description The middle mouse button has been released on the control.
    mouse_middle_release = 10,
    
    /// @description The mouse location has entered the control and no buttons are being held down.
    mouse_enter = 11,
    
    /// @description The mouse location has left the control.
    mouse_leave = 12,
    
    /// @description The scroll wheel position has increased whilst the mouse location has entered the control.
    mouse_wheel_up = 13,
    
    /// @description The scroll wheel position has decreased whilst the mouse location has entered the control.
    mouse_wheel_down = 14,
}

/// @description The initial starting depth of the control.
depth = gui_depth;

/// @description The initial starting image speed of the control.
image_speed = 0;

/// @description Indicates whether the control has focus.
focused = false;

/// @description Indicates whether the control is enabled, determining whether user input can be processed.
enabled = true;

/// @description Indicates whether the mouse has entered the control.
entered = false;

/// @description The textual information to be drawn to this control.
text = new gui_text(null);

/// @description The type to event map, used when registering and firing user input events.
type_to_functions_map = ds_map_create();

/// @function register_event(_type, _function)
/// @description Registers a function to be executed when an event is raised.
/// @argument {int64} _type Specifies the type event to register the function to.
/// @argument {method} _function Specifies the function to execute when the event is raised.
/// @exception {argument_null_exception} The specified {_type} or {_function} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_type} parameter must be of type {int64}.
/// @exception {argument_invalid_type_exception} The specified {_function} parameter must be of type {_function}.
register_event = function(_type, _function)
{
    validate_mf0 _type validate_mf1 "_type" validate_mf2  int64_t validate_mf3;
    validate_mf0 _function validate_mf1 "_function" validate_mf2  method_t validate_mf3;
    
    var _functions = type_to_functions_map[? _type];
    
    if (_functions != null)
    {
        ds_list_add(_functions, _function);
    }
    else
    {
        _functions = ds_list_create();
        ds_list_add(_functions, _function);
        
        ds_map_add(type_to_functions_map, _type, _functions);
    }
}

/// @function raise(_type)
/// @description Raises an event.
/// @argument {int64} _type Specifies the type of the event to raise.
/// @exception {argument_null_exception} The specified {_type} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_type} parameter must be of type {int64}.
raise = function(_type)
{
    validate_mf0 _type validate_mf1 "_type" validate_mf2  int64_t validate_mf3;
    
    var _functions = type_to_functions_map[? _type];
    
    if (_functions == null)
    {
        return;
    }
    
    for (var i = 0; i < ds_list_size(_functions); i++)
    {
        var _function = _functions[| i];
        _function();
    }
}

/// @function set_focus(_state)
/// @description Sets the focus state of this control.
/// @argument {bool} _state Specifies the focus state you wish to set the control too.
/// @exception {argument_null_exception} The specified {_state} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_state} parameter must be of type {bool}.
set_focus = function(_state)
{
    validate_mf0 bool(_state) validate_mf1 "bool(_state)" validate_mf2  bool_t validate_mf3;
    
    if (!enabled)
    {
        return;
    }
    
    if (focused != _state)
    {
        if (_state)
        {
            with (obj_gui_base)
            {
                if (other.id == id)
                {
                    continue;
                }
                
                set_focus(false);
            }
        }
        
        focused = _state;
        raise(int64(focused));
    }
}