/// @description Initialize default parameters.

event_inherited();

/// @description The initial starting depth of the container.
depth += 1;

/// @description The containers children, which moves relative to it's position and depth.
children = ds_list_create();

/// @description The relative grid which contains the relative x, y, and depth values of the containers children.
relative_grid = -1;

/// @description Indicates whether this container is movable.
is_movable = true;

/// @description Indicates whether this container is moving.
is_moving = false;

/// @description The GUI mouse x coordinate from the previous frame.
mouse_prev_x = 0;

/// @description The GUI mouse y coordinate from the previous frame.
mouse_prev_y = 0;

/// @description The containers anchor point, which represents the object or instance which can move the container.
anchor = object_index;

/// @description Indicates whether this container is the topmost container being drawn.
is_topmost = false;

/// @function construct_relative_grid()
/// @description Reconstructs the relative grid for the container.
construct_relative_grid = function()
{
    if (ds_exists(relative_grid, ds_type_grid))
    {
        ds_grid_destroy(relative_grid);
    }
    
    relative_grid = ds_grid_create(4, ds_list_size(children));
    
    for (var i = 0; i < ds_list_size(children); i++)
    {
        var _child = ds_list_find_value(children, i);
        
        ds_grid_set(relative_grid, 0, i, _child);
        ds_grid_set(relative_grid, 1, i, _child.x - x);
        ds_grid_set(relative_grid, 2, i, _child.y - y);
        ds_grid_set(relative_grid, 3, i, abs(_child.depth - depth));
    }
}

/// @function update_positions()
/// @description Updates the positions of all children.
update_positions = function()
{
    for (var i = 0; i < ds_grid_height(relative_grid); i++)
    {
        var _child = ds_grid_get(relative_grid, 0, i);

        var _relative_x = ds_grid_get(relative_grid, 1, i);
        var _relative_y = ds_grid_get(relative_grid, 2, i);
        
        _child.x = x + _relative_x;
        _child.y = y + _relative_y;
    }
}

/// @function update_depths()
/// @description Updates the depths of all children.
update_depths = function()
{
    for (var i = 0; i < ds_grid_height(relative_grid); i++)
    {
        var _child = ds_grid_get(relative_grid, 0, i);
        var _relative_depth = ds_grid_get(relative_grid, 3, i);
        
        _child.depth = depth - _relative_depth;
    }
}

/// @function get_child_topmost_relative_depth()
/// @description Gets the hgihest relative depth value from the children.
/// @return {int32} Returns the highest relative depth value.
get_child_topmost_relative_depth = function()
{
    var _result = 0;
    
    for (var i = 0; i < ds_grid_height(relative_grid); i++)
    {
        var _child = ds_grid_get(relative_grid, 0, i);
        var _relative_depth = ds_grid_get(relative_grid, 3, i);
        
        if (_relative_depth > _result)
        {
            _result = _relative_depth;
        }
    }
    
    return _result;
}

/// @function make_topmost()
/// @description Makes this container the topmost container to be drawn.
make_topmost = function()
{
    var _priority = ds_priority_create();
    ds_priority_add(_priority, id, -16000);
    
    with (obj_gui_container_base)
    {
        if (other.id == id)
        {
            continue;
        }
        
        is_topmost = false;
        
        ds_priority_add(_priority, id, depth);
    }
    
    var _offset = 0;
    
    while (!ds_priority_empty(_priority))
    {
        var _instance = ds_priority_delete_max(_priority);
        
        with (_instance)
        {
            construct_relative_grid();
            depth = gui_depth - _offset;
            update_depths();
            
            _offset += get_child_topmost_relative_depth() + 1;
        }
    }
    
    is_topmost = true;
    
    ds_priority_destroy(_priority);
}