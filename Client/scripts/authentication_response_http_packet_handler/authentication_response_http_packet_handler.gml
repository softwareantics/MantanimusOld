#macro authentication_response_http_packet_handler_t nameof_mf0 "authentication_response_http_packet_handler" nameof_mf1

#macro http_api_user_accounts_authenticate http_api + "UserAccounts/authenticate"

enum authentication_response_code
{
    invalid_credentials = 0,
    
    already_logged_in = 1,
    
    max_login_attemps = 2,
    
    authenticated = 3,
}

struct authentication_response_http_packet_handler() : packet_handler_base() constructor
{
    function display_message(_message)
    {
        with (obj_gui_login_frame_top_bar)
        {
            display_message(_message, c_red);
        }
        
        with (obj_http)
        {
            instance_destroy();
        }
    }
    
    static handle = function(_info)
    {
        switch (_info.data.code)
        {
            case authentication_response_code.invalid_credentials:
                display_message("Invalid Credentials!");
                break;
                
            case authentication_response_code.already_logged_in:
                display_message("You must log out of your current session");
                break;
                
            case authentication_response_code.max_login_attemps:
                display_message("Locked Out: " + string(_info.data.wait_time.minutes) + ":" + string(_info.data.wait_time.seconds));
                break;
                
            case authentication_response_code.authenticated:
                if (!instance_exists(obj_client))
                {
                    instance_create_mf0 obj_client instance_create_mf1;
                }
                
                var _packet = {
                    identifier: int64(_info.data.identifier),
                    token: _info.data.token,
                }
                
                tcp.send_packet("ValidationRequest", _packet);
                break;
        }
    }
}