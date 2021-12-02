/// @description Shorthand for validating if a variable data type is a {http_packet_processor}.
#macro http_packet_processor_t nameof_mf0 "http_packet_processor" nameof_mf1

/// @constructor
/// @implements {packet_processor_base}
/// @description Represents a HTTP packet processor.
struct http_packet_processor() : packet_processor_base() constructor
{
    /// @override
    /// @function get_packet_info()
    /// @description Gets the incoming packet information from a HTTP response.
    /// @return {struct} Returns a struct containing the handler reference, status code and packet data.
    static get_packet_info = function()
    {
        var _status = async_load[? "status"];
        var _result = async_load[? "result"];
        var _url = async_load[? "url"];
        
        return {
            status: _status,
            reference: _url,
            data: json_parse(_result),
        };
    }
}