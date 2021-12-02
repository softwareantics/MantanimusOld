/// @description Shothand for validating if a variables data type is a {base_method_not_defined_exception}.
#macro base_method_not_defined_exception_t nameof_mf0 "base_method_not_defined_exception" nameof_mf1

/// @constructor
/// @implements {exception_base}
/// @description Represents an exception that is thrown when a base method has not been defined in a child class.
/// @argument {string} _base_name The name of the base structure that requires the method to be defined.
/// @argument {string} _method_name The name of the method that has not been defined in the child structure.
/// @exception {argument_null_exception} The specified {_base_name} or {_method_name} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_base_name} or {method_name} parameter must be of type {string}.
struct base_method_not_defined_exception(_base_name, _method_name) : exception_base() constructor
{
    validate_mf0 _base_name validate_mf1 "_base_name" validate_mf2  string_t validate_mf3;
    validate_mf0 _method_name validate_mf1 "_method_name" validate_mf2  string_t validate_mf3;
    
    /// @override
    /// @memberof {exception_base}
    /// @member {string} The short message describing the exception.
    message = "A base method has not been defined in a child class";
    
    /// @override
    /// @memberof {exception_base}
    /// @member {string} The long message describing the exception.
    longMessage = "The base method: " + _method_name + " has not been defined from the base structure: " + _base_name + ".";
}