/// @description Produces the name of a variable, type, or member as a string.
//!#mfunc nameof {"args":["name"],"order":[[1,0]]}
#macro nameof_mf0  //
#macro nameof_mf1 //

/// @description Checks whether the result of an operation returned a value less than zero.
//!#mfunc failed {"args":["result"],"order":[0]}
#macro failed_mf0  //
#macro failed_mf1  < 0

/// @description Creates an object instance at the position of (0, 0) with a depth of zero.
//!#mfunc instance_create {"args":["obj"],"order":[0]}
#macro instance_create_mf0  instance_create_depth(0, 0, 0, 
#macro instance_create_mf1 )

/// @description Shorthand for {validate_parameter}.
//!#mfunc validate {"args":["v"," t"],"order":[0,[1,0],1]}
#macro validate_mf0  validate_parameter(
#macro validate_mf1 , 
#macro validate_mf2 , 
#macro validate_mf3 )

/// @description Shorthand for writing n & 1, easier to remember.
//!#mfunc odd {"args":["n"],"order":[0]}
#macro odd_mf0  //
#macro odd_mf1  & 1 

/// @description Shorthand for writing debug messages.
#macro debug show_debug_message

/// @description Shorthand for writing error messages.
#macro error show_error

/// @description Shothand for checking if a variables data type is a number.
#macro number_t	typeof(NaN)

/// @description Shothand for checking if a variables data type is a string.
#macro string_t	typeof("string")

/// @description Shothand for checking if a variables data type is an array.
#macro array_t typeof([])

/// @description Shothand for checking if a variables data type is a boolean.
#macro bool_t "bool"

/// @description Shothand for checking if a variables data type is a 32-bit integer.
#macro int32_t typeof(2147483647)

/// @description Shothand for checking if a variables data type is a 64-bit integer.
#macro int64_t typeof(9223372036854775807)

/// @description Shothand for checking if a variables data type is a pointer.
#macro ptr_t typeof(ptr(application_surface))

/// @description Shothand for checking if a variables data type is null.
#macro null_t typeof(null)

/// @description Shothand for checking if a variables data type is a 3D vector.
#macro vec3_t "vec3"

/// @description Shothand for checking if a variables data type is a 4D vector.
#macro vec4_t "vec4"

/// @description Shothand for checking if a variables data type is a method.
#macro method_t "method"

/// @description Shothand for checking if a variables data type is a struct.
#macro struct_t "struct"

/// @description Shothand for checking if a variables data type is unknown.
#macro unknown_t "unknown"

/// @description Shorthand for writing undefined.
#macro null undefined

/// @description Shothand for declaring structs.
#macro struct function

/// @description Better way to define empty string.
#macro string_empty ""

#macro regex_username_pattern "^(?=[a-zA-Z0-9._]{5,20}$)(?!.*[_.]{2})[^_.].*[^_.]$"

#macro regex_password_pattern "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"

#macro regex_firstname_pattern "^(?=.{1,40}$)[a-zA-Z]+(?:[-'\s][a-zA-Z]+)*$"

#macro regex_lastname_pattern "^(?=.{1,40}$)[a-zA-Z]+(?:[-'\s][a-zA-Z]+)*$"

#macro regex_email_address_pattern ".{3,}\\@.{3,}\\..{2,}"

/// @function validate_parameter(_variable, _variable_name, _expected_type)
/// @description Validates that the specified {_variable} is not null, or of an incorrect data type.
/// @argument {any - exceptnull} _variable The variable to check for nullity.
/// @argument {string} _variable_name The name of the specified {_variable}.
/// @argument {string} _expected_type The name of the expected type of the specified {_variable}.
/// @exception {argument_null_exception} The specified {_variable} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_variable} parameter must be of type {_expected_type}.
function validate_parameter(_variable, _variable_name, _expected_type)
{
	if (_variable == null)
	{
		throw new argument_null_exception(_variable_name);
	}
	
	if ((typeof(_variable) != _expected_type) && (instanceof(_variable) != _expected_type))
	{
		throw new argument_invalid_type_exception(_variable_name, _expected_type);		
	}
}

/// @function base(_base_name, _method_name)
/// @description Throws a {base_method_not_defined_exception} with the specified parameters.
/// @exception {base_method_not_defined_exception} description.
function base(_base_name, _method_name)
{
    throw new base_method_not_defined_exception(_base_name, _method_name);
}