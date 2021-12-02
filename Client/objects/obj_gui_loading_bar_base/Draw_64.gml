
if (sprite_index == -1)
{
    return;
}

draw_sprite_part(sprite_index, 0, 0, 0, (value / maximum) * sprite_width, sprite_height, x - sprite_xoffset, y - sprite_yoffset);