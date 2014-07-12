package recastnavigation.recast.region {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.rcBuildRegionsMonotone;
	import recastnavigation.recast.RCCompactHeightfield;
	import recastnavigation.recast.RCContext;
	
	use namespace rn_internal;
	
	/**
	 * Builds region data for the heightfield using simple monotone partitioning.
	 */
	public function rcBuildRegionsMonotone(ctx:RCContext, chf:RCCompactHeightfield, 
										   borderSize:int, minRegionArea:int, mergeRegionArea:int):Boolean {
		
		return recastnavigation.internal_api.rcBuildRegionsMonotone(ctx.ptr, chf.ptr, borderSize, minRegionArea, mergeRegionArea);
		
	}
	
}