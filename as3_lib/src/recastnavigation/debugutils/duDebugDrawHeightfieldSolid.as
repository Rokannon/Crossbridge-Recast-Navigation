package recastnavigation.debugutils
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.internal_duDebugDrawHeightfieldSolid;
	import recastnavigation.recast.RCHeightfield;

	use namespace rn_internal;

	public function duDebugDrawHeightfieldSolid(dd:DUDebugDraw, hf:RCHeightfield):void
	{
		internal_duDebugDrawHeightfieldSolid(dd.ptr, hf.ptr);
	}
}