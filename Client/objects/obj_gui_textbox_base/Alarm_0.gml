/// @description Remove characters if backspace is held down.

if (!keyboard_check(vk_backspace))
{
    return;
}

input = string_remove_last(input);
alarm[0] = back_delete_time;