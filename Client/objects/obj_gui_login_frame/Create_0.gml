/// @description Initialize default parameters.

event_inherited();

is_movable = true;

ds_list_add(children,
            obj_gui_login_frame_top_bar,
            obj_gui_login_register_button,
            obj_gui_login_button,
            obj_gui_login_username_textbox,
            obj_gui_login_remember_me_button,
            obj_gui_login_password_textbox);