package recastnavigation.detour.navmesh {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.mallocInt8Vector;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_dtAllocNavMesh;
	import recastnavigation.internal_api.internal_dtFreeNavMesh;
	import recastnavigation.internal_api.internal_dtNavMesh_init;
	
	use namespace rn_internal;
	
	/** A navigation mesh based on tiles of convex polygons. */
	public class DTNavMesh extends RNBase {
		
		/** Initializes the navigation mesh for single tile use. */
		public function init(data:Vector.<int>, flags:int):int {
			
			var data_ptr:int = mallocInt8Vector(data);
			var dataSize:int = data.length;
			var result:int = internal_dtNavMesh_init(ptr, data_ptr, dataSize, flags);
			return result;
			
		}
		
		public override function alloc():void {
			
			ptr = internal_dtAllocNavMesh();
			
		}
		
		public override function free():void {
			
			internal_dtFreeNavMesh(ptr);
			ptr = 0;
			
		}
		
	}
	
}