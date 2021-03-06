/// @description Initialize default parameters.

event_inherited();

text.data = "Login";

register_event(gui_event_type.mouse_left_release, function()
{
    if (obj_gui_login_username_textbox.focus_on_invalid_regex() ||
        obj_gui_login_password_textbox.focus_on_invalid_regex())
    {
        return;
    }
    
    with (obj_gui_login_frame_top_bar)
    {
        display_message("Connecting to server...", c_title);
    }
    
    if (!instance_exists(obj_http))
    {
        instance_create_mf0 obj_http instance_create_mf1;
    }
    
    var _body = {
        username: obj_gui_login_username_textbox.input,
        password: obj_gui_login_password_textbox.input,
    };
    
    http_post_mf0 http_api_user_accounts_authenticate http_post_mf1  _body http_post_mf2;
});