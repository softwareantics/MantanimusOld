/// @description Handle user input and update textbox status if using regular expressions.

if (!focused)
{
    return;
}

if (max_characters == -1 || string_length(input) < max_characters)
{
    caret_blink = true;
    input += keyboard_string;
    
    // Stop the user input from overflowing to other controls.
    keyboard_string = string_empty;
    
    if (use_regex)
    {
        image_index = regex(input, regex_pattern) ? textbox_state.valid : textbox_state.invalid;
    }
}