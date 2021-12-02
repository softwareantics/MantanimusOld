/// @description Shorthand for validating if a variable data type is a {tcp_client}.
#macro tcp_client_t nameof_mf0 "tcp_client" nameof_mf1

/// @constructor
/// @description Represents a TCP client connection.
/// @argument {int32} _port The port number.
/// @argument {string} _ip The IP or URL address.
/// @exception {argument_null_exception} The specified {_port} or {_ip} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_port} parameter must be of type {int32}.
/// @exception {argument_invalid_type_exception} The specified {_ip} parameter must be of type {string}.
/// @exception {network_socket_creation_failure_exception} The underlying TCP network socket couldn't be created.
struct tcp_client(_port, _ip) constructor
{
    validate_mf0 _port validate_mf1 "_port" validate_mf2  int32_t validate_mf3;
	validate_mf0 _ip validate_mf1 "_ip" validate_mf2  string_t validate_mf3;
	
	/// @member {int32} The port number.
	port = _port;
	
	/// @member {string} The IP address.
	ip = _ip;
	
	/// @member {buffer} The write buffer identifier.
	buffer = buffer_create(1, buffer_grow, 1);
	
	/// @member {socket} The network socket identifier.
	socket = network_create_socket(network_socket_tcp);
	
	/// @member {bool} Indicates whether the resources are disposed.
	disposed = false;
	
	if (failed_mf0 socket failed_mf1)
	{
		throw new network_socket_creation_failure_exception(socket_type);
	}
	
	/// @function connect()
	/// @description Connects the underlying network socket to the given port and URL.
	/// @exception {object_disposed_exception} The {tcp_client} has been disposed.
	/// @return {bool} Returns {true} if the client has connected; otherwise, {false}.
	function connect()
	{
		if (disposed)
		{
			throw new object_disposed_exception(nameof_mf0 "tcp_client" nameof_mf1);
		}
		
		var result = failed_mf0 network_connect_raw(socket, ip, port) failed_mf1;
		
		if (result)
		{
			debug("Client Connected: " + server_url + ":" + string(server_port));
		}
		
		return result;
	}
	
	/// @function send_packet(_packet_name, _packet)
	/// @description Sends the specified {_packet} through the underlying network socket.
	/// @argument {string} _packet_name The name of the packet to send through the socket.
	/// @argument {struct} _packet The packet data to be converted to JSON and send through the socket.
	/// @exception {object_disposed_exception} The {tcp_client} has been disposed.
	/// @exception {argument_null_exception} The specified {_packet_name} or {_packet} parameter cannot be null.
	/// @exception {argument_invalid_type_exception} The specified {_packet_name} parameter must be of type {string}.
	/// @exception {argument_invalid_type_exception} The specified {_packet} parameter must be of type {struct}.
	/// @return {bool} {true} if the packet has been sent; otherwise, {false}.
	function send_packet(_packet_name, _packet)
	{
		if (disposed)
		{
			throw new object_disposed_exception(nameof_mf0 "tcp_client" nameof_mf1);
		}
		
		validate_mf0 _packet_name validate_mf1 "_packet_name" validate_mf2  string_t validate_mf3;
		validate_mf0 _packet validate_mf1 "_packet" validate_mf2  struct_t validate_mf3;
	
		var _json = json_stringify(_packet);
		buffer_seek(buffer, buffer_seek_start, 0);
	
		buffer_write(buffer, buffer_s32, string_length(_packet_name));
		buffer_write(buffer, buffer_s32, string_length(_json));
		buffer_write(buffer, buffer_text, _packet_name);
		buffer_write(buffer, buffer_text, _json);
	
		if (failed_mf0 network_send_raw(socket, buffer, buffer_tell(buffer)) failed_mf1)
		{
			debug("Failed to send networking packet: " + _packet_name + ".");
			
			return false;
		}
		
		return true;
	}
	
	/// @function destroy()
	/// @description Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
	function destroy()
	{
		if (disposed)
		{
			return;
		}

		if (socket != null)
		{
			network_destroy(socket);
			socket = null;
		}
		
		if (buffer != null)
		{
			buffer_delete(buffer);
			buffer = null;
		}
		
		disposed = true;
	}
}

/// @constructor
/// @implements {exception_base}
/// @description Represents an exception that is thrown when the creation of a network socket has failed.
/// @argument {int32} _socket_type The type of socket that caused the exception to be thrown.
/// @exception {argument_null_exception} The specified {_socket_type} parameter cannot be null.
/// @exception {argument_invalid_type_exception} The specified {_socket_type} parameter must be of type {int32}.
struct network_socket_creation_failure_exception(_socket_type) : exception_base() constructor
{
	validate_mf0 _socket_type validate_mf1 "_socket_type" validate_mf2  int32_t validate_mf3;
	
	/// @override
	/// @memberof {exception_base}
	/// @member {string} The short message describing the exception.
	message = "The networking socket couldn't be created.";
	
	/// @override
	/// @memberof {exception_base}
	/// @member {string} The long message describing the exception.
	longMessage = "Failed to create a networking socket using socket ID: " + string(_socket_type) + ".";
}