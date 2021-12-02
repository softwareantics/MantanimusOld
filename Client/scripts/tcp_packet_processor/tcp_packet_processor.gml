/// @description Shorthand for validating if a variable data type is a {tcp_packet_processor}.
#macro tcp_packet_processor_t nameof_mf0 "tcp_packet_processor" nameof_mf1

/// @constructor
/// @implements {packet_processor_base}
/// @description Represents a TCP packet processor.
/// @argument {tcp_client} _client The underlying TCP client connection.
/// @exception {argument_null_exception} The specified {_client} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_client} parameter must be of type {tcp_client}.
struct tcp_packet_processor(_client) : packet_processor_base() constructor
{
    validate_mf0 _client validate_mf1 "_client" validate_mf2  tcp_client_t validate_mf3;
    
    /// @member {tcp_client} The underlying TCP client connection.
    client = _client;
    
    /// @override
    /// @function get_packet_info()
    /// @description Gets the incoming packet information from a TCP request or response.
    /// @return {struct} Returns a struct containing the handler reference, packet data and client.
    function get_packet_info()
    {
        var _type = async_load[? "type"];
        
        switch (_type)
        {
            case network_type_data:
                var _buffer = async_load[? "buffer"];
        		var _size = async_load[? "size"];
        		
        		var _name_size = buffer_read(_buffer, buffer_s32);
        		var _data_size = buffer_read(_buffer, buffer_s32);
        		var _name_and_data = buffer_read(_buffer, buffer_string);
        		
        		var _name = string_copy(_name_and_data, 0, _name_size);
        		var _data = string_copy(_name_and_data, _name_size + 1, _data_size);
        		var _packet = json_parse(_data);
        		
        		var _expected_size = _size - 8 - _name_size;
        	
        		if (_data_size != _expected_size)
        		{
        			debug("Possible data allocation attack with a buffer size of: " + string(_data_size) + "bytes.");
        		}
        		
        		return {
        			reference: _name,
        			data: _packet,
        			client: self.client,
        		};
        		break;
        }
    }
}