package recastnavigation.debugutils
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.detour.navmeshquery.DTNavMeshQuery;
	import recastnavigation.internal_api.internal_duDebugDrawNavMeshNodes;

	use namespace rn_internal;

	public function duDebugDrawNavMeshNodes(dd:DUDebugDraw, query:DTNavMeshQuery):void
	{
		internal_duDebugDrawNavMeshNodes(dd.ptr, query.ptr);
	}
}