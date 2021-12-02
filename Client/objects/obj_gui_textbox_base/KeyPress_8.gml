/// @description Remove the last character and start the backspace alarm.

if (!focused)
{
    return;
}

if (keyboard_check_pressed(vk_backspace))
{
    input = string_remove_last(input);
    alarm[0] = back_wait_time;
}