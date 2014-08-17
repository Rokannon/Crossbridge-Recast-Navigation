package recastnavigation.detour.navmesh
{
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.internal_api.CModule;

	use namespace rn_internal;

	/**
	 * Provides high level information related to a dtMeshTile object.
	 */
	public class DTMeshHeader extends RNBase
	{
		rn_internal static var SIZE							:int = 0;
		rn_internal static const OFFSET_MAGIC				:int = offset(4);
		rn_internal static const OFFSET_VERSION				:int = offset(4);
		rn_internal static const OFFSET_X					:int = offset(4);
		rn_internal static const OFFSET_Y					:int = offset(4);
		rn_internal static const OFFSET_LAYER				:int = offset(4);
		rn_internal static const OFFSET_USER_ID				:int = offset(4);
		rn_internal static const OFFSET_POLY_COUNT			:int = offset(4);
		rn_internal static const OFFSET_VERT_COUNT			:int = offset(4);
		rn_internal static const OFFSET_MAX_LINK_COUNT		:int = offset(4);
		rn_internal static const OFFSET_DETAIL_MESH_COUNT	:int = offset(4);
		rn_internal static const OFFSET_DETAIL_VERT_COUNT	:int = offset(4);
		rn_internal static const OFFSET_DETAIL_TRI_COUNT	:int = offset(4);
		rn_internal static const OFFSET_BV_NODE_COUNT		:int = offset(4);
		rn_internal static const OFFSET_OFFMESH_CON_COUNT	:int = offset(4);
		rn_internal static const OFFSET_OFFMESH_BASE		:int = offset(4);
		rn_internal static const OFFSET_WALKABLE_HEIGHT		:int = offset(4);
		rn_internal static const OFFSET_WALKABLE_RADIUS		:int = offset(4);
		rn_internal static const OFFSET_WALKABLE_CLIMB		:int = offset(4);
		rn_internal static const OFFSET_BMIN				:int = offset(12);
		rn_internal static const OFFSET_BMAX				:int = offset(12);
		rn_internal static const OFFSET_BV_QUANT_FACTOR		:int = offset(4);

		private static function offset(size:int):int { return (SIZE += size) - size; }

		/** Tile magic number. (Used to identify the data format.) */
		public function get magic():int { return CModule.read32(ptr + OFFSET_MAGIC); }
		public function set magic(value:int):void { CModule.write32(ptr + OFFSET_MAGIC, value); }

		/** Tile data format version number. */
		public function get version():int { return CModule.read32(ptr + OFFSET_VERSION); }
		public function set version(value:int):void { CModule.write32(ptr + OFFSET_VERSION, value); }

		/** The x-position of the tile within the dtNavMesh tile grid. (x, y, layer) */
		public function get x():int { return CModule.read32(ptr + OFFSET_X); }
		public function set x(value:int):void { CModule.write32(ptr + OFFSET_X, value); }

		/** The y-position of the tile within the dtNavMesh tile grid. (x, y, layer) */
		public function get y():int { return CModule.read32(ptr + OFFSET_Y); }
		public function set y(value:int):void { CModule.write32(ptr + OFFSET_Y, value); }

		/** The layer of the tile within the dtNavMesh tile grid. (x, y, layer) */
		public function get layer():int { return CModule.read32(ptr + OFFSET_LAYER); }
		public function set layer(value:int):void { CModule.write32(ptr + OFFSET_LAYER, value); }

		/** The user defined id of the tile. */
		public function get userId():int { return CModule.read32(ptr + OFFSET_USER_ID); }
		public function set userId(value:int):void { CModule.write32(ptr + OFFSET_USER_ID, value); }

		/** The number of polygons in the tile. */
		public function get polyCount():int { return CModule.read32(ptr + OFFSET_POLY_COUNT); }
		public function set polyCount(value:int):void { CModule.write32(ptr + OFFSET_POLY_COUNT, value); }

		/** The number of vertices in the tile. */
		public function get vertCount():int { return CModule.read32(ptr + OFFSET_VERT_COUNT); }
		public function set vertCount(value:int):void { CModule.write32(ptr + OFFSET_VERT_COUNT, value); }

		/** The number of allocated links. */
		public function get maxLinkCount():int { return CModule.read32(ptr + OFFSET_MAX_LINK_COUNT); }
		public function set maxLinkCount(value:int):void { CModule.write32(ptr + OFFSET_MAX_LINK_COUNT, value); }

		/** The number of sub-meshes in the detail mesh. */
		public function get detailMeshCount():int { return CModule.read32(ptr + OFFSET_DETAIL_MESH_COUNT); }
		public function set detailMeshCount(value:int):void { CModule.write32(ptr + OFFSET_DETAIL_MESH_COUNT, value); }

		/** The number of unique vertices in the detail mesh. (In addition to the polygon vertices.) */
		public function get detailVertCount():int { return CModule.read32(ptr + OFFSET_DETAIL_VERT_COUNT); }
		public function set detailVertCount(value:int):void { CModule.write32(ptr + OFFSET_DETAIL_VERT_COUNT, value); }

		/** The number of triangles in the detail mesh. */
		public function get detailTriCount():int { return CModule.read32(ptr + OFFSET_DETAIL_TRI_COUNT); }
		public function set detailTriCount(value:int):void { CModule.write32(ptr + OFFSET_DETAIL_TRI_COUNT, value); }

		/** The number of bounding volume nodes. (Zero if bounding volumes are disabled.) */
		public function get bvNodeCount():int { return CModule.read32(ptr + OFFSET_BV_NODE_COUNT); }
		public function set bvNodeCount(value:int):void { CModule.write32(ptr + OFFSET_BV_NODE_COUNT, value); }

		/** The number of off-mesh connections. */
		public function get offMeshConCount():int { return CModule.read32(ptr + OFFSET_OFFMESH_CON_COUNT); }
		public function set offMeshConCount(value:int):void { CModule.write32(ptr + OFFSET_OFFMESH_CON_COUNT, value); }

		/** The index of the first polygon which is an off-mesh connection. */
		public function get offMeshBase():int { return CModule.read32(ptr + OFFSET_OFFMESH_BASE); }
		public function set offMeshBase(value:int):void { CModule.write32(ptr + OFFSET_OFFMESH_BASE, value); }

		/** The height of the agents using the tile. */
		public function get walkableHeight():Number { return CModule.readFloat(ptr + OFFSET_WALKABLE_HEIGHT); }
		public function set walkableHeight(value:Number):void { CModule.writeFloat(ptr + OFFSET_WALKABLE_HEIGHT, value); }

		/** The radius of the agents using the tile. */
		public function get walkableRadius():Number { return CModule.readFloat(ptr + OFFSET_WALKABLE_RADIUS); }
		public function set walkableRadius(value:Number):void { CModule.writeFloat(ptr + OFFSET_WALKABLE_RADIUS, value); }

		/** The maximum climb height of the agents using the tile. */
		public function get walkableClimb():Number { return CModule.readFloat(ptr + OFFSET_WALKABLE_CLIMB); }
		public function set walkableClimb(value:Number):void { CModule.writeFloat(ptr + OFFSET_WALKABLE_CLIMB, value); }

		/** The minimum bounds of the tile's AABB. Component x. [(x, y, z)] */
		public function get bminX():Number { return CModule.readFloat(ptr + OFFSET_BMIN); }
		public function set bminX(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN, value); }

		/** The minimum bounds of the tile's AABB. Component y. [(x, y, z)] */
		public function get bminY():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 4); }
		public function set bminY(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 4, value); }

		/** The minimum bounds of the tile's AABB. Component z. [(x, y, z)] */
		public function get bminZ():Number { return CModule.readFloat(ptr + OFFSET_BMIN + 8); }
		public function set bminZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMIN + 8, value); }

		/** The maximum bounds of the tile's AABB. Component x. [(x, y, z)] */
		public function get bmaxX():Number { return CModule.readFloat(ptr + OFFSET_BMAX); }
		public function set bmaxX(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX, value); }

		/** The maximum bounds of the tile's AABB. Component y. [(x, y, z)] */
		public function get bmaxY():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 4); }
		public function set bmaxY(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 4, value); }

		/** The maximum bounds of the tile's AABB. Component z. [(x, y, z)] */
		public function get bmaxZ():Number { return CModule.readFloat(ptr + OFFSET_BMAX + 8); }
		public function set bmaxZ(value:Number):void { CModule.writeFloat(ptr + OFFSET_BMAX + 8, value); }

		/** The bounding volume quantization factor. */
		public function get bvQuantFactor():Number { return CModule.readFloat(ptr + OFFSET_BV_QUANT_FACTOR); }
		public function set bvQuantFactor(value:Number):void { CModule.writeFloat(ptr + OFFSET_BV_QUANT_FACTOR, value); }
	}
}