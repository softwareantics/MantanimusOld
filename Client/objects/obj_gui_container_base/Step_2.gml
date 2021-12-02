/// @description Handle user input and topmost ordering of the container.

if (focused && !is_topmost)
{
    make_topmost();
}

for (var i = 0; i < ds_list_size(children); i++)
{
    var _child = ds_list_find_value(children, i);
    
    if (_child.focused && !is_topmost)
    {
        make_topmost();
    }
}

if (instance_position_topmost(mouse_gui_x, mouse_gui_y, anchor) == anchor.id)
{
    if (mouse_check_button_pressed(mb_left) && anchor.focused)
    {
        if (is_movable)
        {
            construct_relative_grid();
            make_topmost();
            
            is_moving = true;
        }
    }
}

if (mouse_check_button_released(mb_left) && is_moving)
{
    is_moving = false;
}