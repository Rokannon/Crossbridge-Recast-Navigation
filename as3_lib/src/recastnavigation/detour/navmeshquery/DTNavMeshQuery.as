package recastnavigation.detour.navmeshquery {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.detour.navmesh.DTNavMesh;
	import recastnavigation.internal_api.internal_dtAllocNavMeshQuery;
	import recastnavigation.internal_api.internal_dtFreeNavMeshQuery;
	import recastnavigation.internal_api.internal_dtNavMeshQuery_init;
	
	use namespace rn_internal;
	
	/**
	 * Provides the ability to perform pathfinding related queries against a navigation mesh.
	 */
	public class DTNavMeshQuery extends RNBase {
		
		/** Initializes the query object. */
		public function init(nav:DTNavMesh, maxNodes:int):int {
			
			return internal_dtNavMeshQuery_init(ptr, nav.ptr, maxNodes);
			
		}
		
		public override function alloc():void {
			
			ptr = internal_dtAllocNavMeshQuery();
			
		}
		
		public override function free():void {
			
			internal_dtFreeNavMeshQuery(ptr);
			ptr = 0;
			
		}
		
	}
	
}