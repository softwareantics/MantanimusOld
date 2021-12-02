/// @description Shorthand for validating if a variable data type is an {argument_null_exception}.
#macro argument_null_exception_t nameof_mf0 "argument_null_exception" nameof_mf1

/// @constructor
/// @implements {exception_base}
/// @description Represents an exception that is thrown when a null reference is passed to a method that does not accept it as a valid argument.
/// @argument {string} _param_name The name of the parameter that caused the exception to be thrown.
/// @exception {argument_null_exception} The specified {_param_name} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_param_name} parameter must be of type {string}.
struct argument_null_exception(_param_name) : exception_base() constructor
{
    validate_mf0 _param_name validate_mf1 "_param_name" validate_mf2  string_t validate_mf3;

	/// @override
	/// @memberof {exception_base}
	/// @member {string} The short message describing the exception.
	message = "The parameter cannot be null.";
	
	/// @override
	/// @memberof {exception_base}
	/// @member {string} The long message describing the exception.
	longMessage = "The specified " + _param_name + " parameter cannot be null.";
}