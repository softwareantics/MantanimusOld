/// @function instance_position_topmost(_x, _y, _object).
/// @description Gets the instance of the specified {_object} with the lowest depth at the specified {_x} and {_y} coordinates.
/// @argument {number} _x The x coordinate to check for instances of the specified {_object}.
/// @argument {number} _y The y coordinate to check for instances of the specified {_object}.
/// @argument {object} _object The object to check for instances for at the specified {_x} and {_y} coordinates.
/// @exception {argument_null_exception} The specified {_x}, {_y} or {_object} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_x} or {_y} parameter must be of type {number}.
/// @exception {argument_invalid_type_exception} The specified {_object} parameter must be of type {object}.
/// @return {instance|noone} Returns the instance of the specified {_object} with the lowest depth; otherwise, {noone}.
function instance_position_topmost(_x, _y, _object)
{
    validate_mf0 _x validate_mf1 "_x" validate_mf2  number_t validate_mf3;
    validate_mf0 _y validate_mf1 "_y" validate_mf2  number_t validate_mf3;
    validate_mf0 _object validate_mf1 "_object" validate_mf2  int32_t validate_mf3;
    
    var _instance = noone;
    var _list = ds_list_create();
    var _count = instance_position_list(_x, _y, _object, _list, false);
    
    for (var i = 0; i < _count; i++)
    {
        var _other = _list[| i];
        
        if (!instance_exists(_instance) || _other.depth < _instance.depth)
        {
            _instance = _other;
        }
    }
    
    ds_list_destroy(_list);
    
    return _instance;
}