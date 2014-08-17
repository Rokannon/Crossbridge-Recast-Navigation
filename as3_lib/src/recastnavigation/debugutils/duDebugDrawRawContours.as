package recastnavigation.debugutils
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_duDebugDrawRawContours;
	import recastnavigation.recast.contour.RCContourSet;

	use namespace rn_internal;

	public function duDebugDrawRawContours(dd:DUDebugDraw, cset:RCContourSet, alpha:Number = 1.0):void
	{
		internal_duDebugDrawRawContours(dd.ptr, cset.ptr, alpha);
	}
}