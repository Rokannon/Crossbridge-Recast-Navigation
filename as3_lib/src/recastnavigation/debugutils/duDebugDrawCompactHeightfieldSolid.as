package recastnavigation.debugutils
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_duDebugDrawCompactHeightfieldSolid;
	import recastnavigation.recast.RCCompactHeightfield;

	use namespace rn_internal;

	public function duDebugDrawCompactHeightfieldSolid(dd:DUDebugDraw, chf:RCCompactHeightfield):void
	{
		internal_duDebugDrawCompactHeightfieldSolid(dd.ptr, chf.ptr);
	}
}