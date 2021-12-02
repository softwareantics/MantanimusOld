
var _lists = ds_map_values_to_array(type_to_functions_map);

for (var i = 0; i < array_length(_lists); i++)
{
    ds_list_destroy(_lists[i]);
}

ds_map_destroy(type_to_functions_map);