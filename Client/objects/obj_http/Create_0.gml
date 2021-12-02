/// @description Setup packet processor.

if (instance_number(obj_http) > 1)
{
	throw "You can only create one HTTP object.";
}

/// @description Represents the current API host location.
#macro http_api "https://localhost:44302/api/"

//!#mfunc http_post {"args":["url"," body"],"order":[0,1]}
#macro http_post_mf0  http_request(
#macro http_post_mf1 , "POST", default_header_map, json_stringify(
#macro http_post_mf2 ))

#macro default_header_map global.json_header_map

default_header_map = ds_map_create();

ds_map_add(default_header_map, "Content-Type", "application/json");

/// @description The HTTP packet processor, used to handling incoming HTTP packet.
processor = new http_packet_processor();

processor.register_handler(http_api_user_accounts_authenticate, new authentication_response_http_packet_handler());