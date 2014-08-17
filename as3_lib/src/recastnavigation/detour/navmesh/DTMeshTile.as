package recastnavigation.detour.navmesh
{
	import recastnavigation.core.RNBase;
	import recastnavigation.core.rn_internal;
	import recastnavigation.core.utils.copyBytes;
	import recastnavigation.internal_api.CModule;

	use namespace rn_internal;

	/**
	 * Defines a navigation mesh tile.
	 */
	public class DTMeshTile extends RNBase
	{
		rn_internal static var SIZE								:int = 0;
		rn_internal static const OFFSET_SALT					:int = offset(4);
		rn_internal static const OFFSET_LINKS_FREE_LIST			:int = offset(4);
		rn_internal static const OFFSET_HEADER					:int = offset(4);
		rn_internal static const OFFSET_POLYS					:int = offset(4);
		rn_internal static const OFFSET_VERTS					:int = offset(4);
		rn_internal static const OFFSET_LINKS					:int = offset(4);
		rn_internal static const OFFSET_DETAIL_MESHES			:int = offset(4);
		rn_internal static const OFFSET_DETAIL_VERTS			:int = offset(4);
		rn_internal static const OFFSET_DETAIL_TRIS				:int = offset(4);
		rn_internal static const OFFSET_BV_TREE					:int = offset(4);
		rn_internal static const OFFSET_OFF_MESH_CONS			:int = offset(4);
		rn_internal static const OFFSET_DATA					:int = offset(4);
		rn_internal static const OFFSET_DATA_SIZE				:int = offset(4);
		rn_internal static const OFFSET_FLAGS					:int = offset(4);
		rn_internal static const OFFSET_NEXT					:int = offset(4);

		private static function offset(size:int):int { return (SIZE += size) - size; }

		/** Counter describing modifications to the tile. */
		public function get salt():int { return CModule.read32(ptr + OFFSET_SALT); }
		public function set salt(value:int):void { CModule.write32(ptr + OFFSET_SALT, value); }

		/** Index to the next free link. */
		public function get linksFreeList():int { return CModule.read32(ptr + OFFSET_LINKS_FREE_LIST); }
		public function set linksFreeList(value:int):void { CModule.write32(ptr + OFFSET_LINKS_FREE_LIST, value); }

		/** The tile header. Getter. */
		public function getHeader(resultHeader:DTMeshHeader = null):DTMeshHeader
		{
			if (resultHeader == null) resultHeader = new DTMeshHeader();
			resultHeader.ptr = CModule.read32(ptr + OFFSET_HEADER);
			return resultHeader;
		}

		/** The tile header. Setter. */
		public function setHeader(value:DTMeshHeader):void
		{
			CModule.write32(ptr + OFFSET_HEADER, value.ptr);
		}

		/** The tile polygons. Getter. [Size: dtMeshHeader::polyCount] */
		public function getPoly(index:int, resultPoly:DTPoly = null):DTPoly
		{
			if (resultPoly == null) resultPoly = new DTPoly();
			resultPoly.ptr = CModule.read32(CModule.read32(ptr + OFFSET_POLYS) + DTPoly.SIZE * index);
			return resultPoly;
		}

		/** The tile polygons. Setter. [Size: dtMeshHeader::polyCount] */
		public function setPoly(index:int, value:DTPoly):void
		{
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_POLYS) + DTPoly.SIZE * index, DTPoly.SIZE);
		}

		/** The tile vertices. Getter. [Size: dtMeshHeader::vertCount] */
		public function getVert(index:int):Number { return CModule.readFloat(CModule.read32(ptr + OFFSET_VERTS) + 4 * index); }

		/** The tile vertices. Setter. [Size: dtMeshHeader::vertCount] */
		public function setVert(index:int, value:Number):void { CModule.writeFloat(CModule.read32(ptr + OFFSET_VERTS) + 4 * index, value); }

		/** The tile links. Getter. [Size: dtMeshHeader::maxLinkCount] */
		public function getLink(index:int, resultLink:DTLink = null):DTLink
		{
			if (resultLink == null) resultLink = new DTLink();
			resultLink.ptr = CModule.read32(CModule.read32(ptr + OFFSET_LINKS) + DTLink.SIZE * index);
			return resultLink;
		}

		/** The tile links. Setter. [Size: dtMeshHeader::maxLinkCount] */
		public function setLink(index:int, value:DTLink):void
		{
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_LINKS) + DTLink.SIZE * index, DTLink.SIZE);
		}

		/** The tile's detail sub-meshes. Getter. [Size: dtMeshHeader::detailMeshCount] */
		public function getDetailMesh(index:int, resultDetailMesh:DTPolyDetail = null):DTPolyDetail
		{
			if (resultDetailMesh == null) resultDetailMesh = new DTPolyDetail();
			resultDetailMesh.ptr = CModule.read32(CModule.read32(ptr + OFFSET_DETAIL_MESHES) + DTPolyDetail.SIZE * index);
			return resultDetailMesh;
		}

		/** The tile's detail sub-meshes. Setter. [Size: dtMeshHeader::detailMeshCount] */
		public function setDetailMesh(index:int, value:DTPolyDetail):void
		{
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_DETAIL_MESHES) + DTPolyDetail.SIZE * index, DTPolyDetail.SIZE);
		}

		/** The detail mesh's unique vertices. Getter. [(x, y, z) * dtMeshHeader::detailVertCount] */
		public function getDetailVert(index:int):Number { return CModule.readFloat(CModule.read32(ptr + OFFSET_DETAIL_VERTS) + 4 * index); }

		/** The detail mesh's unique vertices. Setter. [(x, y, z) * dtMeshHeader::detailVertCount] */
		public function setDetailVert(index:int, value:Number):void { CModule.writeFloat(CModule.read32(ptr + OFFSET_DETAIL_VERTS) + 4 * index, value); }

		/** The detail mesh's triangles. Getter. [(vertA, vertB, vertC) * dtMeshHeader::detailTriCount] */
		public function getDetailTri(index:int):int { return CModule.read8(CModule.read32(ptr + OFFSET_DETAIL_TRIS) + 1 * index); }

		/** The detail mesh's triangles. Setter. [(vertA, vertB, vertC) * dtMeshHeader::detailTriCount] */
		public function setDetailTri(index:int, value:int):void { CModule.write8(CModule.read32(ptr + OFFSET_DETAIL_TRIS) + 1 * index, value); }

		/** The tile bounding volume nodes. Getter. [Size: dtMeshHeader::bvNodeCount] (Will be null if bounding volumes are disabled.) */
		public function getBVTree(resultTree:DTBVNode = null):DTBVNode
		{
			if (resultTree == null) resultTree = new DTBVNode();
			resultTree.ptr = CModule.read32(ptr + OFFSET_BV_TREE);
			return resultTree;
		}

		/** The tile bounding volume nodes. Setter. [Size: dtMeshHeader::bvNodeCount] (Will be null if bounding volumes are disabled.) */
		public function setBVTree(value:DTBVNode):void
		{
			CModule.write32(ptr + OFFSET_BV_TREE, value.ptr);
		}

		/** The tile off-mesh connections. Getter. [Size: dtMeshHeader::offMeshConCount] */
		public function getOffMeshCon(index:int, resultCon:DTOffMeshConnection = null):DTOffMeshConnection
		{
			if (resultCon == null) resultCon = new DTOffMeshConnection();
			resultCon.ptr = CModule.read32(CModule.read32(ptr + OFFSET_OFF_MESH_CONS) + DTOffMeshConnection.SIZE * index);
			return resultCon;
		}

		/** The tile off-mesh connections. Setter. [Size: dtMeshHeader::offMeshConCount] */
		public function setOffMeshCon(index:int, value:DTOffMeshConnection):void
		{
			copyBytes(value.ptr, CModule.read32(ptr + OFFSET_OFF_MESH_CONS) + DTOffMeshConnection.SIZE * index, DTOffMeshConnection.SIZE);
		}

		/** The tile data. (Not directly accessed under normal situations.) Getter. */
		public function getData(index:int):int { return CModule.read8(CModule.read32(ptr + OFFSET_DATA) + 1 * index); }

		/** The tile data. (Not directly accessed under normal situations.) Setter. */
		public function setData(index:int, value:int):void { CModule.write8(CModule.read32(ptr + OFFSET_DATA) + 1 * index, value); }

		/** Size of the tile data. */
		public function get dataSize():int { return CModule.read32(ptr + OFFSET_DATA_SIZE); }
		public function set dataSize(value:int):void { CModule.write32(ptr + OFFSET_DATA_SIZE, value); }

		/** Tile flags. (See: #dtTileFlags) */
		public function get flags():int { return CModule.read32(ptr + OFFSET_FLAGS); }
		public function set flags(value:int):void { CModule.write32(ptr + OFFSET_FLAGS, value); }

		/** The next free tile, or the next tile in the spatial grid. Getter. */
		public function getNext(resultTile:DTMeshTile = null):DTMeshTile
		{
			if (resultTile == null) resultTile = new DTMeshTile();
			resultTile.ptr = CModule.read32(ptr + OFFSET_NEXT);
			return resultTile;
		}

		/** The next free tile, or the next tile in the spatial grid. Setter. */
		public function setNext(value:DTMeshTile):void
		{
			CModule.write32(ptr + OFFSET_NEXT, value.ptr);
		}
	}
}