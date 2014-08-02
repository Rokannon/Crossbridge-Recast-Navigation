package recastnavigation.detour.navmesh {
	
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;
	import recastnavigation.internal_api.internal_dtPoly_getArea;
	import recastnavigation.internal_api.internal_dtPoly_getType;
	import recastnavigation.internal_api.internal_dtPoly_setArea;
	import recastnavigation.internal_api.internal_dtPoly_setType;
	
	use namespace rn_internal;
	
	/**
	 * Defines a polyogn within a dtMeshTile object.
	 */
	public class DTPoly extends RNBase {
		
		rn_internal static var SIZE								:int = 0;
		rn_internal static const OFFSET_FIRST_LINK				:int = offset(4);
		rn_internal static const OFFSET_VERTS					:int = offset(2 * DTNavMesh.DT_VERTS_PER_POLYGON);
		rn_internal static const OFFSET_NEIS					:int = offset(2 * DTNavMesh.DT_VERTS_PER_POLYGON);
		rn_internal static const OFFSET_FLAGS					:int = offset(2);
		rn_internal static const OFFSET_VERT_COUNT				:int = offset(1);
		rn_internal static const OFFSET_AREA_AND_TYPE			:int = offset(1);
		
		private static function offset(size:int):int { return (SIZE += size) - size; }
		
		/** Index to first link in linked list. (Or #DT_NULL_LINK if there is no link.) */
		public function get firstLink():int { return CModule.read32(ptr + OFFSET_FIRST_LINK); }
		public function set firstLink(value:int):void { CModule.write32(ptr + OFFSET_FIRST_LINK, value); }
		
		/** The indices of the polygon's vertices. The actual vertices are located in dtMeshTile::verts. Getter. */
		public function getVert(index:int):int { return CModule.read16(ptr + OFFSET_VERTS + 2 * index); }
		
		/** The indices of the polygon's vertices. The actual vertices are located in dtMeshTile::verts. Setter. */
		public function setVert(index:int, value:int):void { CModule.write16(ptr + OFFSET_VERTS + 2 * index, value); }
		
		/** Packed data representing neighbor polygons references and flags for each edge. Getter. */
		public function getNei(index:int):int { return CModule.read16(ptr + OFFSET_NEIS + 2 * index); }
		
		/** Packed data representing neighbor polygons references and flags for each edge. Setter. */
		public function setNei(index:int, value:int):void { CModule.write16(ptr + OFFSET_NEIS + 2 * index, value); }
		
		/** The user defined polygon flags. */
		public function get flags():int { return CModule.read16(ptr + OFFSET_FLAGS); }
		public function set flags(value:int):void { CModule.write16(ptr + OFFSET_FLAGS, value); }
		
		/** The number of vertices in the polygon. */
		public function get vertCount():int { return CModule.read8(ptr + OFFSET_VERT_COUNT); }
		public function set vertCount(value:int):void { CModule.write8(ptr + OFFSET_VERT_COUNT, value); }
		
		/** The bit packed area id and polygon type. */
		public function get areaAndtype():int { return CModule.read8(ptr + OFFSET_AREA_AND_TYPE); }
		public function set areaAndtype(value:int):void { CModule.write8(ptr + OFFSET_AREA_AND_TYPE, value); }
		
		/** Sets the user defined area id. [Limit: < #DT_MAX_AREAS] */
		public function setArea(a:int):void { internal_dtPoly_setArea(ptr, a); }
		
		/** Sets the polygon type. (See: #dtPolyTypes.) */
		public function setType(t:int):void { internal_dtPoly_setType(ptr, t); }
		
		/** Gets the user defined area id. */
		public function getArea():int { return internal_dtPoly_getArea(ptr); }
		
		/** Gets the polygon type. (See: #dtPolyTypes) */
		public function getType():int { return internal_dtPoly_getType(ptr); }
		
	}
	
}