package recastnavigation.recast {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.mallocInt32Vector;
	import recastnavigation.core.utils.mallocNumberVector;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_rcMarkWalkableTriangles;
	
	use namespace rn_internal;
	
	/**
	 * Sets the area id of all triangles with a slope below the specified value to #RC_WALKABLE_AREA.
	 */
	public function rcMarkWalkableTriangles(ctx:RCContext, walkableSlopeAngle:Number, verts:Vector.<Number>, 
											tris:Vector.<int>, nt:int, resultAreas:Vector.<int>):void {
		
		var i:int;
		
		resultAreas.fixed = false;
		resultAreas.length = nt;
		resultAreas.fixed = true;
		
		var verts_ptr:int = mallocNumberVector(verts);
		var tris_ptr:int = mallocInt32Vector(tris);
		
		var areas_ptr:int = CModule.malloc(nt);
		for (i = 0; i < nt; ++i) {
			CModule.write8(areas_ptr + i, 0);
		}
		
		internal_rcMarkWalkableTriangles(ctx.ptr, walkableSlopeAngle, verts_ptr, tris_ptr, nt, areas_ptr);
		
		CModule.free(verts_ptr);
		CModule.free(tris_ptr);
		
		for (i = 0; i < nt; ++i) {
			resultAreas[i] = CModule.read8(areas_ptr + i);
		}
		CModule.free(areas_ptr);
		
	}
	
}