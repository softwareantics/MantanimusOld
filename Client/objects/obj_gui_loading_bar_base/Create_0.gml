/// @description Initialize default parameters.

event_inherited();

depth -= 1;

/// @description The amount by which a call to {progress} increases the current position of the loading bar. 
step = 1;

/// @description The minimum value of the loading bar, you'd usually keep this at zero.
minimum = 0;

/// @description The maximum value of the loading bar, you'd usually set this to the amount of files you're loading.
maximum = 100;

/// @description The current position of the loading bar.
value = 0;

/// @function progress()
/// @description Advances the current position of the loading bar by the step field.
progress = function()
{
    value = value + step >= maximum ? minimum : value + step;
}

/// @function get_percentage()
/// @description Gets the total percetange of completion of the loading bar.
get_percentage = function()
{
    return round((value / maximum) * 100);
}