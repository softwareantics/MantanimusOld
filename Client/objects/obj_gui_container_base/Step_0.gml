/// @description Handles moving the container and it's children.

event_inherited();

if (is_moving && is_movable)
{
    if (mouse_gui_x != mouse_prev_x || mouse_gui_y != mouse_prev_y)
    {
        x += mouse_gui_x - mouse_prev_x;
        y += mouse_gui_y - mouse_prev_y;
        
        update_positions();
    }
}

mouse_prev_x = mouse_gui_x;
mouse_prev_y = mouse_gui_y;