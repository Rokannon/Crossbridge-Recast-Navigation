package recastnavigation.recast.mesh {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.rcBuildPolyMesh;
	import recastnavigation.recast.RCContext;
	import recastnavigation.recast.contour.RCContourSet;
	
	use namespace rn_internal;
	
	/**
	 * Builds a polygon mesh from the provided contours.
	 */
	public function rcBuildPolyMesh(ctx:RCContext, cset:RCContourSet, nvp:int, mesh:RCPolyMesh):Boolean {
		
		return recastnavigation.internal_api.rcBuildPolyMesh(ctx.ptr, cset.ptr, nvp, mesh.ptr);
		
	}
	
}