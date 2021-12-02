/// @description Shorthand for validating if a variable data type is an {argument_exception}.
#macro argument_exception_t nameof_mf0 "argument_exception" nameof_mf1

/// @constructor
/// @implements {exception_base}
/// @description Represents an exception that is thrown when one of the arguments provided to a method is not valid.
/// @argument {string} _message The short message describing the exception.
/// @argument {string} _param_name The name of the parameter that caused the exception to be thrown.
/// @exception {argument_null_exception} The specified {_message} or {_param_name} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_message} or {_param_name parameter must be of type {string}.
struct argument_exception(_message, _param_name) : exception_base() constructor
{
    validate_mf0 _message validate_mf1 "_message" validate_mf2  string_t validate_mf3;
    validate_mf0 _param_name validate_mf1 "_param_name" validate_mf2  string_t validate_mf3;
    
    /// @override
    /// @memberof {exception_base}
    /// @member {string} The short message describing the exception.
    message = _message;
    
    /// @override
    /// @memberof {exception_base}
    /// @member {string} The long message describing the exception.
    longMessage = "This method was thrown thanks to the specified parameter: " + _param_name + ".";
}