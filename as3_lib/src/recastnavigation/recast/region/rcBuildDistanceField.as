package recastnavigation.recast.region {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.rcBuildDistanceField;
	import recastnavigation.recast.RCCompactHeightfield;
	import recastnavigation.recast.RCContext;
	
	use namespace rn_internal;
	
	/**
	 * Builds the distance field for the specified compact heightfield. 
	 */
	public function rcBuildDistanceField(ctx:RCContext, chf:RCCompactHeightfield):Boolean {
		
		return recastnavigation.internal_api.rcBuildDistanceField(ctx.ptr, chf.ptr);
		
	}
	
}