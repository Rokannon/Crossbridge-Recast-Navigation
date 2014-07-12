package recastnavigation.recast.region {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.rcBuildLayerRegions;
	import recastnavigation.recast.RCCompactHeightfield;
	import recastnavigation.recast.RCContext;
	
	use namespace rn_internal;
	
	/**
	 * Builds region data for the heightfield by partitioning the heightfield in non-overlapping layers.
	 */
	public function rcBuildLayerRegions(ctx:RCContext, chf:RCCompactHeightfield, 
										borderSize:int, minRegionArea:int):Boolean {
		
		return recastnavigation.internal_api.rcBuildLayerRegions(ctx.ptr, chf.ptr, borderSize, minRegionArea);
		
	}
	
}