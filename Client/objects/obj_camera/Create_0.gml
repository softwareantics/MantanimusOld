/// @description Initialize default parameters.

if (instance_number(obj_camera) > 1)
{
	throw "You can only create one camera.";
}

/// @description Shorthand for writing {view_camera[0]}.
#macro view view_camera[0]