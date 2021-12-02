/// @description Handle user input and add caret character if required.

event_inherited();

text.data = string_empty;

if (input == string_empty)
{
    image_index = textbox_state.standard;
}
else
{
    if (hide_characters)
    {
        text.data = string_repeat(hidden_character, string_length(input));
    }
    else
    {
        text.data = string_scroll(input, text.font, scroll_width);
    }
}

if (focused && caret_blink)
{
    text.data += caret_character;
}