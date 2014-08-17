package recastnavigation.recast.region
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_rcBuildRegions;
	import recastnavigation.recast.RCCompactHeightfield;
	import recastnavigation.recast.RCContext;

	use namespace rn_internal;

	/**
	 * Builds region data for the heightfield using watershed partitioning.
	 */
	public function rcBuildRegions(ctx:RCContext, chf:RCCompactHeightfield,
								   borderSize:int, minRegionArea:int, mergeRegionArea:int):Boolean
	{
		return internal_rcBuildRegions(ctx.ptr, chf.ptr, borderSize, minRegionArea, mergeRegionArea);
	}
}