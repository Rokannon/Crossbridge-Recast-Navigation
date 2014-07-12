package recastnavigation.recast.contour {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.rcBuildContours;
	import recastnavigation.recast.RCCompactHeightfield;
	import recastnavigation.recast.RCContext;
	
	use namespace rn_internal;
	
	/**
	 * Builds a contour set from the region outlines in the provided compact heightfield.
	 */
	public function rcBuildContours(ctx:RCContext, chf:RCCompactHeightfield, maxError:Number, 
									maxEdgeLen:int, cset:RCContourSet, buildFlags:int):Boolean {
		
		return recastnavigation.internal_api.rcBuildContours(ctx.ptr, chf.ptr, maxError, maxEdgeLen, cset.ptr, buildFlags);
		
	}
	
}