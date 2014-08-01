package recastnavigation.debugutils {
	
	import recastnavigation.core.rn_internal;
	import recastnavigation.detour.navmesh.DTNavMesh;
	import recastnavigation.internal_api.internal_duDebugDrawNavMeshBVTree;
	
	use namespace rn_internal;
	
	public function duDebugDrawNavMeshBVTree(dd:DUDebugDraw, mesh:DTNavMesh):void {
		
		internal_duDebugDrawNavMeshBVTree(dd.ptr, mesh.ptr);
		
	}
	
}