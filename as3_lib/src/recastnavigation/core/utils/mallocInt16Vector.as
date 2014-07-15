package recastnavigation.core.utils {
	
	import recastnavigation.internal_api.CModule;
	
	public function mallocInt16Vector(vector:Vector.<int>):int {
		
		var ptr:int = CModule.malloc(2 * vector.length);
		for (var i:int = vector.length - 1; i >= 0; --i) {
			CModule.write16(ptr + 2 * i, vector[i]);
		}
		return ptr;
		
	}
	
}