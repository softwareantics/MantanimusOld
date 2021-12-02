/// @description Shorthand for validating if a variable data type is an {exception_base}.
#macro exception_base_t nameof_mf0 "exception_base" nameof_mf1

/// @interface {exception_base}
/// @description Defines an interface that represents errors that occur during application execution.
struct exception_base() constructor
{
	/// @member {string} The short message describing the exception.
	message = null;
	
	/// @member {string} The long message describing the exception.
	longMessage = null;
	
	/// @member {array} An array of strings that is the stack frame the exception was generated.
	stacktrace = debug_get_callstack();
}