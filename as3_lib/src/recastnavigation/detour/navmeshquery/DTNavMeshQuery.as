package recastnavigation.detour.navmeshquery {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.detour.navmesh.DTNavMesh;
	import recastnavigation.detour.status.dtStatusSucceed;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_dtAllocNavMeshQuery;
	import recastnavigation.internal_api.internal_dtFreeNavMeshQuery;
	import recastnavigation.internal_api.internal_dtNavMeshQuery_findNearestPoly;
	import recastnavigation.internal_api.internal_dtNavMeshQuery_init;
	import recastnavigation.internal_api.internal_dtNavMeshQuery_queryPolygons;
	
	use namespace rn_internal;
	
	/**
	 * Provides the ability to perform pathfinding related queries against a navigation mesh.
	 */
	public class DTNavMeshQuery extends RNBase {
		
		private var _helperMem12_1:int;
		private var _helperMem12_2:int;
		private var _helperMem12_3:int;
		private var _helperMem4:int;
		private var _helperMem512:int;
		
		/** Initializes the query object. */
		public function init(nav:DTNavMesh, maxNodes:int):int {
			
			return internal_dtNavMeshQuery_init(ptr, nav.ptr, maxNodes);
			
		}
		
		public var nearestRef:int;
		public var nearestPtX:Number;
		public var nearestPtY:Number;
		public var nearestPtZ:Number;
		
		/** Finds the polygon nearest to the specified center point. */
		public function findNearestPoly(
			centerX:Number, centerY:Number, centerZ:Number, 
			extentsX:Number, extentsY:Number, extentsZ:Number, 
			filter:DTQueryFilter):int {
			
			CModule.writeFloat(_helperMem12_1 + 0, centerX);
			CModule.writeFloat(_helperMem12_1 + 4, centerY);
			CModule.writeFloat(_helperMem12_1 + 8, centerZ);
			
			CModule.writeFloat(_helperMem12_2 + 0, extentsX);
			CModule.writeFloat(_helperMem12_2 + 4, extentsY);
			CModule.writeFloat(_helperMem12_2 + 8, extentsZ);
			
			var result:int = internal_dtNavMeshQuery_findNearestPoly(
				ptr, _helperMem12_1, _helperMem12_2, 
				filter.ptr, _helperMem4, _helperMem12_3
			);
			
			if (dtStatusSucceed(result)) {
				nearestRef = CModule.read32(_helperMem4);
				nearestPtX = CModule.readFloat(_helperMem12_3);
				nearestPtY = CModule.readFloat(_helperMem12_3 + 4);
				nearestPtZ = CModule.readFloat(_helperMem12_3 + 8);
			}
			
			return result;
			
		}
		
		public const polys:Vector.<int> = new Vector.<int>();
		
		/** Finds polygons that overlap the search box. */
		public function queryPolygons(
			centerX:Number, centerY:Number, centerZ:Number, 
			extentsX:Number, extentsY:Number, extentsZ:Number, 
			filter:DTQueryFilter):int {
			
			CModule.writeFloat(_helperMem12_1 + 0, centerX);
			CModule.writeFloat(_helperMem12_1 + 4, centerY);
			CModule.writeFloat(_helperMem12_1 + 8, centerZ);
			
			CModule.writeFloat(_helperMem12_2 + 0, extentsX);
			CModule.writeFloat(_helperMem12_2 + 4, extentsY);
			CModule.writeFloat(_helperMem12_2 + 8, extentsZ);
			
			var result:int = internal_dtNavMeshQuery_queryPolygons(
				ptr, _helperMem12_1, _helperMem12_2, 
				filter.ptr, _helperMem512, _helperMem4, 128
			);
			
			if (dtStatusSucceed(result)) {
				polys.length = 0;
				var length:int = CModule.read32(_helperMem4);
				for (var i:int = 0; i < length; ++i) {
					polys[i] = CModule.read32(_helperMem512 + 4 * i);
				}
			}
			
			return result;
			
		}
		
		public override function alloc():void {
			
			ptr = internal_dtAllocNavMeshQuery();
			_helperMem12_1 = CModule.malloc(12);
			_helperMem12_2 = CModule.malloc(12);
			_helperMem12_3 = CModule.malloc(12);
			_helperMem4 = CModule.malloc(4);
			_helperMem512 = CModule.malloc(512);
			
		}
		
		public override function free():void {
			
			internal_dtFreeNavMeshQuery(ptr);
			ptr = 0;
			CModule.free(_helperMem12_1);
			CModule.free(_helperMem12_2);
			CModule.free(_helperMem12_3);
			CModule.free(_helperMem4);
			CModule.free(_helperMem512);
			
		}
		
	}
	
}