/// @description Shorthand for validating if a variable data type is a {object_disposed_exception}.
#macro object_disposed_exception_t nameof_mf0 "object_disposed_exception" nameof_mf1

/// @constructor
/// @implements {exception_base}
/// @description Represents an exception that is thrown when an operation is performed on a disposed object.
/// @argument {string} _object_name The name of the object that cause the exception to be thrown.
/// @exception {argument_null_exception} The specified {_object_name} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_object_name} parameter must be of type {string}.
struct object_disposed_exception(_object_name) constructor
{
    validate_mf0 _object_name validate_mf1 "_object_name" validate_mf2  string_t validate_mf3;
    
    /// @override
    /// @memberof {exception_base}
    /// @member {string} The short message describing the exception.
    message = "The object has been disposed.";
    
    /// @override
    /// @memberof {exception_base}
    /// @member {string} The long message describing the exception.
    longMessage = "The specified object: " + object_name + " has been disposed.";
}