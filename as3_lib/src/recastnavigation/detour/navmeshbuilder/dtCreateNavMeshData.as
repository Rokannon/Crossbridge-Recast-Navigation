package recastnavigation.detour.navmeshbuilder {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_dtCreateNavMeshData;
	
	use namespace rn_internal;
	
	/**
	 * Builds navigation mesh tile data from the provided tile creation data.
	 */
	public function dtCreateNavMeshData(params:DTNavMeshCreateParams, outData:Vector.<int>):Boolean {
		
		var outData_ptr_ptr:int = CModule.malloc(4);
		var outDataSize_ptr:int = CModule.malloc(4);
		var result:Boolean = internal_dtCreateNavMeshData(params.ptr, outData_ptr_ptr, outDataSize_ptr); 
		outData.length = CModule.read32(CModule.read32(outDataSize_ptr));
		for (var i:int = outData.length - 1; i >= 0; ++i) {
			outData[i] = CModule.read8(CModule.read32(outData_ptr_ptr) + 1 * i);
		}
		CModule.free(outData_ptr_ptr);
		CModule.free(outDataSize_ptr);
		return result;
		
	}
	
}