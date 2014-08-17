package recastnavigation.debugutils
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_duLogBuildTimes;
	import recastnavigation.recast.RCContext;

	use namespace rn_internal;

	public function duLogBuildTimes(ctx:RCContext, totalTileUsec:int):void
	{
		internal_duLogBuildTimes(ctx.ptr, totalTileUsec);
	}
}