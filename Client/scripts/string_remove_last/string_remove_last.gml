/// @function string_remove_last(_string).
/// @description Deletes the last character from the specified {_string} and returns the result.
/// @argument {string} _string The string to delete the last character from.
/// @exception {argument_null_exception} The specified {_string} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_string} parameter must be of type {string}.
/// @return {string} Returns The {_string} parameter with the last character removed.
function string_remove_last(_string)
{
    validate_mf0 _string validate_mf1 "_string" validate_mf2  string_t validate_mf3;
    
    return string_delete(_string, string_length(_string), 1);
}