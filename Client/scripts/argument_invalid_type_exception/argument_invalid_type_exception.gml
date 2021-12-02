/// @description Shorthand for validating if a variable data type is an {argument_invalid_type_exception}.
#macro argument_invalid_type_exception_t nameof_mf0 "argument_invalid_type_exception" nameof_mf1

/// @constructor
/// @implements {exception_base}
/// @description Represents an exception that is thrown when a parameter of invalid type is passed as an argument to a method or constructor.
/// @argument {string} _param_name The name of the parameter that caused the exception to be thrown.
/// @argument {string} _expected_type The name of the expected data type.
/// @exception {argument_null_exception} The specified {_param_name} or {_expecte_type} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_param_name} or {_expected_type} parameter must be of type {string}.
struct argument_invalid_type_exception(_param_name, _expected_type) : exception_base() constructor
{
    validate_mf0 _param_name validate_mf1 "_param_name" validate_mf2  string_t validate_mf3;
	validate_mf0 _expected_type validate_mf1 "_expected_type" validate_mf2  string_t validate_mf3;
	
	/// @override
	/// @memberof {exception_base}
	/// @member {string} The short message describing the exception.
	message = "The parameter is not of the expected type.";
	
	/// @override
	/// @memberof {exception_base}
	/// @member {string} The long message describing the exception.
	longMessage = "The specified " + _param_name + " parameter is not of the specified type: " + _expected_type + ".";
}