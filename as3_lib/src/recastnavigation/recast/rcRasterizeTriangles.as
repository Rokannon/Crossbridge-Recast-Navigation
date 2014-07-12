package recastnavigation.recast {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.mallocIntVector;
	import recastnavigation.core.utils.mallocNumberVector;
	import recastnavigation.internal_api.rcRasterizeTriangles;
	
	use namespace rn_internal;
	
	/**
	 * Rasterizes an indexed triangle mesh into the specified heightfield.
	 */
	public function rcRasterizeTriangles(ctx:RCContext, verts:Vector.<Number>, tris:Vector.<int>, areas:Vector.<int>, 
										 nt:int, solid:RCHeightfield, flagMergeThr:int):void {
		
		var verts_ptr:int = mallocNumberVector(verts);
		var tris_ptr:int = mallocIntVector(tris);
		var areas_ptr:int = mallocIntVector(areas);
		
		recastnavigation.internal_api.rcRasterizeTriangles(ctx.ptr, verts_ptr, tris_ptr, areas_ptr, nt, solid.ptr, flagMergeThr); 
		
	}
	
}