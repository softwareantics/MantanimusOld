/// @description Shothand for validating if a variables data type is a {packet_processor_base}.
#macro packet_processor_base_t nameof_mf0 "packet_processor_base" nameof_mf1

/// @interface {packet_processor_base}
/// @description Defines an interface that represents a generic packet processor.
struct packet_processor_base() constructor
{
	/// @member {ds_map} The reference to packet handler map used when handling incoming packet information.
    map = ds_map_create();
    
    /// @member {bool} Indicates whether the resources are disposed.
    disposed = false;
    
    /// @function register_handler(_reference, _handler)
    /// @description Registers the specified {_reference} to the specified {_handler}.
    /// @exception {argument_null_exception} The specified {_reference} or {_handler} parameter cannot be null.
    /// @exception {argument_exception} A handler for the specified {_reference} has already been added to the processor.
    function register_handler(_reference, _handler)
    {
    	if (_reference == null)
    	{
    		throw new argument_null_exception(nameof_mf0 "_reference" nameof_mf1);
    	}
    	
    	if (_handler == null)
    	{
    		throw new argument_null_exception(nameof_mf0 "_handler" nameof_mf1);
    	}
    	
    	if (ds_map_exists(map, _reference))
    	{
    		throw new argument_exception("A handler for reference: " + string(_reference) + " has already been added to the packet processor.", nameof_mf0 "_reference" nameof_mf1);
    	}
    	
    	ds_map_add(map, _reference, _handler);
    }
    
    /// @async
    /// @function async_process()
    /// @description Handles incoming packet information.
    function async_process()
    {
        var _info = get_packet_info();
        var _handler = ds_map_find_value(map, _info.reference);

		if (_handler == null)
		{
			debug("Failed to find handler for reference: " + string(_info.reference));
		}

        _handler.handle(_info);
    }
    
    /// @abstract
    /// @function get_packet_info()
    /// @description Gets the incoming packet information and converts it to a format readable by the processor and handler.
    /// @return {struct} Returns a struct with a {reference} to the packets handler and the {data} required to handle the packet.
    static get_packet_info = function()
    {
    	base(nameof_mf0 "packet_processor_base" nameof_mf1, nameof_mf0 "get_packet_info" nameof_mf1);
    }
    
    /// @function destroy()
    /// @description Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
	function destroy()
	{
		if (disposed)
		{
			return;
		}
		
		if (map != null)
		{
			ds_map_destroy(map);
			map = null;
		}
		
		disposed = true;
	}
}