/// @description Handle UI user input.

if (!enabled)
{
    return;
}

if (instance_position_topmost(mouse_gui_x, mouse_gui_y, obj_gui_base) == id)
{
    if (!entered && !mouse_check_button(mb_any))
    {
        raise(gui_event_type.mouse_enter);
        entered = true;
    }
    
    if (mouse_check_button(mb_left))
    {
        raise(gui_event_type.mouse_left);
    }
    
    if (mouse_check_button(mb_right))
    {
        raise(gui_event_type.mouse_right);
    }
    
    if (mouse_check_button(mb_middle))
    {
        raise(gui_event_type.mouse_middle);
    }
    
    if (mouse_check_button_pressed(mb_left))
    {
        set_focus(true);
        raise(gui_event_type.mouse_left_press);
    }
    
    if (mouse_check_button_pressed(mb_right))
    {
        raise(gui_event_type.mouse_right_press);
    }
    
    if (mouse_check_button_pressed(mb_middle))
    {
        raise(gui_event_type.mouse_middle_press);
    }
    
    if (mouse_check_button_released(mb_left) && focused)
    {
        raise(gui_event_type.mouse_left_release);
    }
    
    if (mouse_check_button_released(mb_right) && focused)
    {
        raise(gui_event_type.mouse_right_release);
    }
    
    if (mouse_check_button_released(mb_middle) && focused)
    {
        raise(gui_event_type.mouse_middle_release);
    }
    
    if (mouse_wheel_up())
    {
        raise(gui_event_type.mouse_wheel_up);
    }
    
    if (mouse_wheel_down())
    {
        raise(gui_event_type.mouse_wheel_down);
    }
}
else
{
    if (mouse_check_button_pressed(mb_left) && focused)
    {
        set_focus(false);
    }
    
    if (entered)
    {
        raise(gui_event_type.mouse_leave);
        entered = false;
    }
}