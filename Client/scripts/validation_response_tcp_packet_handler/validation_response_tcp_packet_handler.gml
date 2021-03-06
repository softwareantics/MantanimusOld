struct validation_response_tcp_packet_handler() : packet_handler_base() constructor
{
    static handle = function(_info)
    {
        var _valid = bool(_info.data.is_valid);
        
        if (!_valid)
        {
            obj_gui_login_frame_top_bar.display_message("Connection Error...", c_red);
            
            with (obj_client)
            {
                instance_destroy();
            }
            
            with (obj_http)
            {
                instance_destroy();
            }
        }
        else
        {
            // TODO: Obviously change this.
            obj_gui_login_frame_top_bar.display_message("Welcome, " + obj_gui_login_username_textbox.input + "!", c_green);
        }
    }
}