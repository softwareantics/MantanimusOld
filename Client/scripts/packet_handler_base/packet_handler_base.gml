/// @description Shothand for validating if a variables data type is a {packet_handler_base}.
#macro packet_handler_base_t nameof_mf0 "packet_handler_base" nameof_mf1

/// @interface {packet_handler_base}
/// @description Defines an interface that represents a packet handler.
struct packet_handler_base() constructor
{
    /// @abstract
    /// @function handle(_info)
    /// @description Handles the incoming packet information.
    static handle = function(_info)
    {
        base(nameof_mf0 "packet_handler_base" nameof_mf1, nameof_mf0 "handle" nameof_mf1);
    }
}