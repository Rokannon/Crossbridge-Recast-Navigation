package recastnavigation.debugutils
{
	import recastnavigation.core.rn_internal;
	import recastnavigation.detour.navmesh.DTNavMesh;
	import recastnavigation.internal_api.internal_duDebugDrawNavMeshPortals;

	use namespace rn_internal;

	public function duDebugDrawNavMeshPortals(dd:DUDebugDraw, mesh:DTNavMesh):void
	{
		internal_duDebugDrawNavMeshPortals(dd.ptr, mesh.ptr);
	}
}