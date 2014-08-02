package recastnavigation.detour.navmesh {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	
	use namespace rn_internal;
	
	/**
	 * Defines the location of detail sub-mesh data within a dtMeshTile.
	 */
	public class DTPolyDetail extends RNBase {
		
		rn_internal static var SIZE						:int = 0;
		rn_internal static const OFFSET_VERT_BASE		:int = offset(4);
		rn_internal static const OFFSET_TRI_VASE		:int = offset(4);
		rn_internal static const OFFSET_VERT_COUNT		:int = offset(1);
		rn_internal static const OFFSET_TRI_COUNT		:int = offset(1);
		
		private static function offset(size:int):int { return (SIZE += size) - size; }
		
		/** The offset of the vertices in the dtMeshTile::detailVerts array. */
		public function get vertBase():int { return CModule.read32(ptr + OFFSET_VERT_BASE); }
		public function set vertBase(value:int):void { CModule.write32(ptr + OFFSET_VERT_BASE, value); }
		
		/** The offset of the triangles in the dtMeshTile::detailTris array. */
		public function get triBase():int { return CModule.read32(ptr + OFFSET_TRI_VASE); }
		public function set triBase(value:int):void { CModule.write32(ptr + OFFSET_TRI_VASE, value); }
		
		/** The number of vertices in the sub-mesh. */
		public function get vertCount():int { return CModule.read8(ptr + OFFSET_VERT_COUNT); }
		public function set vertCount(value:int):void { CModule.write8(ptr + OFFSET_VERT_COUNT, value); }
		
		/** The number of triangles in the sub-mesh. */
		public function get triCount():int { return CModule.read8(ptr + OFFSET_TRI_COUNT); }
		public function set triCount(value:int):void { CModule.write8(ptr + OFFSET_TRI_COUNT, value); }
		
	}
	
}