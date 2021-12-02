/// @description Connect to server.	

if (instance_number(self) > 1)
{
	throw "You can only create one client.";
}

/// @description The networking socket type.
#macro socket_type network_socket_tcp

/// @description The server URL/port.
#macro server_url "127.0.0.1"

/// @description The server port number.
#macro server_port 59875

#macro tcp obj_client.connection

/// @description The TCP client connection.
connection = new tcp_client(server_port, server_url);

/// @description The TCP packet processor, for handling incoming TCP packets.
processor = new tcp_packet_processor(connection);

processor.register_handler("ValidationResponse", new validation_response_tcp_packet_handler());

connection.connect();