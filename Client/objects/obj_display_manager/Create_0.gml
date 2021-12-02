/// @description Initialize display properties

if (instance_number(obj_display_manager) > 1)
{
	throw "You can only create one display manager.";
}

#macro window_width window_get_width()

#macro window_height window_get_height()

/// @description Shorthand for writing {display_get_width}.
#macro display_width display_get_width()

/// @description Shorthand for writing {display_get_height}.
#macro display_height display_get_height()

/// @description Shorthand for writing {display_get_gui_width}.
#macro gui_width display_get_gui_width()

/// @description Shorthand for writing {display_get_gui_height}.
#macro gui_height display_get_gui_height()

/// @description Shorthand for writing {obj_display_manager.ideal_width}.
#macro game_width obj_display_manager.ideal_width

/// @description Shorthand for writing {obj_display_manager.ideal_height}.
#macro game_height obj_display_manager.ideal_height

#macro mouse_gui_x device_mouse_x_to_gui(0)

#macro mouse_gui_y device_mouse_y_to_gui(0)

/// @function function(_display, _dimension)
/// @description Calculates pixel perfect scaling.
/// @argument {int32_t} _display The horizontal or vertical display size.
/// @argument {int32_t} _dimension The ideal width or height of the game.
/// @return {int32_t} The pixel perfect result of the operation.
perfect_scale = function(_display, _dimension)
{
    validate_mf0 _display validate_mf1 "_display" validate_mf2  int32_t validate_mf3;
    validate_mf0 _dimension validate_mf1 "_dimension" validate_mf2  int32_t validate_mf3;
    
    return _display / round(_display / _dimension);
}

/// @function solve_odd_dimension(_dimension)
/// @description Checks if the specified {_dimension} parameter is odd and if so, returns a corrected value.
/// @argument {int32_t} _dimension The ideal perfect perfect width or height of the game.
/// @return {int32_t} The corrected value of an odd dimension, or {_dimension} if no correction was applied.
solve_odd_dimension = function(_dimension)
{
    validate_mf0 _dimension validate_mf1 "_dimension" validate_mf2  int32_t validate_mf3;
    
    if (odd_mf0 _dimension odd_mf1)
    {
        return _dimension++;
    }
    
    return _dimension;
}

/// @description The aspect ratio of the current display monitor.
aspect_ratio = display_width / display_height;

/// @description The ideal height (in pixels) of the game.
ideal_height = solve_odd_dimension(perfect_scale(display_height, 360));

/// @description The ideal width (in pixels) of the game.
ideal_width = solve_odd_dimension(perfect_scale(display_width, round(ideal_height * aspect_ratio)));

/// @description The current window scale.
window_scale = 3;

window_set_size(ideal_width * window_scale, ideal_height * window_scale);
display_set_gui_size(ideal_width * window_scale, ideal_height * window_scale);
surface_resize(application_surface, ideal_width * window_scale, ideal_height * window_scale);

alarm[0] = 1;

room_goto_next();