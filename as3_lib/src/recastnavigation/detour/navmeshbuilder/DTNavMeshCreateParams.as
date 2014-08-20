package recastnavigation.detour.navmeshbuilder
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.copyBytes;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.core.utils.setBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_dtAlloc_dtNavMeshCreateParams;
    import recastnavigation.internal_api.internal_dtFree;
    import recastnavigation.recast.RCConfig;
    import recastnavigation.recast.mesh.RCPolyMesh;
    import recastnavigation.recast.meshdetail.RCPolyMeshDetail;

    use namespace rn_internal;

    /**
     * Represents the source data used to build an navigation mesh tile.
     */
    public class DTNavMeshCreateParams extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_VERTS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_VERT_COUNT:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_POLYS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_POLY_FLAGS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_POLY_AREAS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_POLY_COUNT:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_NVP:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_DETAIL_MESHES:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_DETAIL_VERTS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_DETAIL_VERTS_COUNT:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_DETAIL_TRIS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_DETAIL_TRI_COUNT:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_VERTS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_RAD:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_FLAGS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_AREAS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_DIR:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_USER_ID:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_OFF_MESH_CON_COUNT:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_USER_ID:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_TILE_X:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_TILE_Y:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_TILE_LAYER:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_BMIN:int = offsetBytes(12, DTNavMeshCreateParams);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(12, DTNavMeshCreateParams);
        rn_internal static const OFFSET_WALKABLE_HEIGHT:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_WALKABLE_RADIUS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_WALKABLE_CLIMB:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_CS:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_CH:int = offsetBytes(4, DTNavMeshCreateParams);
        rn_internal static const OFFSET_BUILD_BV_TREE:int = offsetBytes(4, DTNavMeshCreateParams);

        /** The polygon mesh vertices. Getter. [(x, y, z) * #vertCount] [Unit: vx] */
        public function getVert(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_VERTS) + 2 * index);
        }

        /** The polygon mesh vertices. Setter. [(x, y, z) * #vertCount] [Unit: vx] */
        public function setVert(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_VERTS) + 2 * index, value);
        }

        /** The number vertices in the polygon mesh. [Limit: >= 3] */
        public function get vertCount():int
        {
            return CModule.read32(ptr + OFFSET_VERT_COUNT);
        }

        public function set vertCount(value:int):void
        {
            CModule.write32(ptr + OFFSET_VERT_COUNT, value);
        }

        /** The polygon data. Getter. [Size: #polyCount * 2 * #nvp] */
        public function getPoly(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_POLYS) + 2 * index);
        }

        /** The polygon data. Setter. [Size: #polyCount * 2 * #nvp] */
        public function setPoly(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_POLYS) + 2 * index, value);
        }

        /** The user defined flags assigned to each polygon. Getter. [Size: #polyCount] */
        public function getPolyFlag(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_POLY_FLAGS) + 2 * index);
        }

        /** The user defined flags assigned to each polygon. Setter. [Size: #polyCount] */
        public function setPolyFlag(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_POLY_FLAGS) + 2 * index, value);
        }

        /** The user defined area ids assigned to each polygon. Getter. [Size: #polyCount] */
        public function getPolyArea(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_POLY_AREAS) + 2 * index);
        }

        /** The user defined area ids assigned to each polygon. Setter. [Size: #polyCount] */
        public function setPolyArea(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_POLY_AREAS) + 2 * index, value);
        }

        /** Number of polygons in the mesh. [Limit: >= 1] */
        public function get polyCount():int
        {
            return CModule.read32(ptr + OFFSET_POLY_COUNT);
        }

        public function set polyCount(value:int):void
        {
            CModule.write32(ptr + OFFSET_POLY_COUNT, value);
        }

        /** Number maximum number of vertices per polygon. [Limit: >= 3] */
        public function get nvp():int
        {
            return CModule.read32(ptr + OFFSET_NVP);
        }

        public function set nvp(value:int):void
        {
            CModule.write32(ptr + OFFSET_NVP, value);
        }

        /** The height detail sub-mesh data. Getter. [Size: 4 * #polyCount] */
        public function getDetailMesh(index:int):int
        {
            return CModule.read32(CModule.read32(ptr + OFFSET_DETAIL_MESHES) + 4 * index);
        }

        /** The height detail sub-mesh data. Setter. [Size: 4 * #polyCount] */
        public function setDetailMesh(index:int, value:int):void
        {
            CModule.write32(CModule.read32(ptr + OFFSET_DETAIL_MESHES) + 4 * index, value);
        }

        /** The detail mesh vertices. Getter. [Size: 3 * #detailVertsCount] [Unit: wu] */
        public function getDetailVert(index:int):Number
        {
            return CModule.readFloat(CModule.read32(ptr + OFFSET_DETAIL_VERTS) + 4 * index);
        }

        /** The detail mesh vertices. Setter. [Size: 3 * #detailVertsCount] [Unit: wu] */
        public function setDetailVert(index:int, value:Number):void
        {
            CModule.writeFloat(CModule.read32(ptr + OFFSET_DETAIL_VERTS) + 4 * index, value);
        }

        /** The number of vertices in the detail mesh. */
        public function get detailVertsCount():int
        {
            return CModule.read32(ptr + OFFSET_DETAIL_VERTS_COUNT);
        }

        public function set detailVertsCount(value:int):void
        {
            CModule.write32(ptr + OFFSET_DETAIL_VERTS_COUNT, value);
        }

        /** The detail mesh triangles. Getter. [Size: 4 * #detailTriCount] */
        public function getDetailTri(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_DETAIL_TRIS) + 1 * index);
        }

        /** The detail mesh triangles. Setter. [Size: 4 * #detailTriCount] */
        public function setDetailTri(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_DETAIL_TRIS) + 1 * index, value);
        }

        /** The number of triangles in the detail mesh. */
        public function get detailTriCount():int
        {
            return CModule.read32(ptr + OFFSET_DETAIL_TRI_COUNT);
        }

        public function set detailTriCount(value:int):void
        {
            CModule.write32(ptr + OFFSET_DETAIL_TRI_COUNT, value);
        }

        /** Off-mesh connection vertices. Getter. [(ax, ay, az, bx, by, bz) * #offMeshConCount] [Unit: wu] */
        public function getOffMeshConVert(index:int):Number
        {
            return CModule.readFloat(CModule.read32(ptr + OFFSET_OFF_MESH_CON_VERTS) + 4 * index);
        }

        /** Off-mesh connection vertices. Setter. [(ax, ay, az, bx, by, bz) * #offMeshConCount] [Unit: wu] */
        public function setOffMeshConVert(index:int, value:Number):void
        {
            CModule.writeFloat(CModule.read32(ptr + OFFSET_OFF_MESH_CON_VERTS) + 4 * index, value);
        }

        /** Off-mesh connection radii. Getter. [Size: #offMeshConCount] [Unit: wu] */
        public function getOffMeshConRad(index:int):Number
        {
            return CModule.readFloat(CModule.read32(ptr + OFFSET_OFF_MESH_CON_RAD) + 4 * index);
        }

        /** Off-mesh connection radii. Setter. [Size: #offMeshConCount] [Unit: wu] */
        public function setOffMeshConRad(index:int, value:Number):void
        {
            CModule.writeFloat(CModule.read32(ptr + OFFSET_OFF_MESH_CON_RAD) + 4 * index, value);
        }

        /** User defined flags assigned to the off-mesh connections. Getter. [Size: #offMeshConCount] */
        public function getOffMeshConFlag(index:int):int
        {
            return CModule.read16(CModule.read32(ptr + OFFSET_OFF_MESH_CON_FLAGS) + 2 * index);
        }

        /** User defined flags assigned to the off-mesh connections. Setter. [Size: #offMeshConCount] */
        public function setOffMeshConFlag(index:int, value:int):void
        {
            CModule.write16(CModule.read32(ptr + OFFSET_OFF_MESH_CON_FLAGS) + 2 * index, value);
        }

        /** User defined area ids assigned to the off-mesh connections. Getter. [Size: #offMeshConCount] */
        public function getOffMeshConArea(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_OFF_MESH_CON_AREAS) + 1 * index);
        }

        /** User defined area ids assigned to the off-mesh connections. Setter. [Size: #offMeshConCount] */
        public function setOffMeshConArea(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_OFF_MESH_CON_AREAS) + 1 * index, value);
        }

        /** The permitted travel direction of the off-mesh connections. Getter. [Size: #offMeshConCount] */
        public function getOffMeshConDir(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_OFF_MESH_CON_DIR) + 1 * index);
        }

        /** The permitted travel direction of the off-mesh connections. Setter. [Size: #offMeshConCount] */
        public function setOffMeshConDir(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_OFF_MESH_CON_DIR) + 1 * index, value);
        }

        /** The user defined ids of the off-mesh connection. Getter. [Size: #offMeshConCount] */
        public function getOffMeshConUserID(index:int):int
        {
            return CModule.read32(CModule.read32(ptr + OFFSET_OFF_MESH_CON_USER_ID) + 4 * index);
        }

        /** The user defined ids of the off-mesh connection. Setter. [Size: #offMeshConCount] */
        public function setOffMeshConUserID(index:int, value:int):void
        {
            CModule.write32(CModule.read32(ptr + OFFSET_OFF_MESH_CON_USER_ID) + 4 * index, value);
        }

        /** The number of off-mesh connections. [Limit: >= 0] */
        public function get offMeshConCount():int
        {
            return CModule.read32(ptr + OFFSET_OFF_MESH_CON_COUNT);
        }

        public function set offMeshConCount(value:int):void
        {
            CModule.write32(ptr + OFFSET_OFF_MESH_CON_COUNT, value);
        }

        /** The user defined id of the tile. */
        public function get userId():int
        {
            return CModule.read32(ptr + OFFSET_USER_ID);
        }

        public function set userId(value:int):void
        {
            CModule.write32(ptr + OFFSET_USER_ID, value);
        }

        /** The tile's x-grid location within the multi-tile destination mesh. (Along the x-axis.) */
        public function get tileX():int
        {
            return CModule.read32(ptr + OFFSET_TILE_X);
        }

        public function set tileX(value:int):void
        {
            CModule.write32(ptr + OFFSET_TILE_X, value);
        }

        /** The tile's y-grid location within the multi-tile desitation mesh. (Along the z-axis.) */
        public function get tileY():int
        {
            return CModule.read32(ptr + OFFSET_TILE_Y);
        }

        public function set tileY(value:int):void
        {
            CModule.write32(ptr + OFFSET_TILE_Y, value);
        }

        /** The tile's layer within the layered destination mesh. [Limit: >= 0] (Along the y-axis.) */
        public function get tileLayer():int
        {
            return CModule.read32(ptr + OFFSET_TILE_LAYER);
        }

        public function set tileLayer(value:int):void
        {
            CModule.write32(ptr + OFFSET_TILE_LAYER, value);
        }

        /** The minimum bounds of the tile. Component x. [(x, y, z)] [Unit: wu] */
        public function get bminX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN);
        }

        public function set bminX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN, value);
        }

        /** The minimum bounds of the tile. Component y. [(x, y, z)] [Unit: wu] */
        public function get bminY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 4);
        }

        public function set bminY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 4, value);
        }

        /** The minimum bounds of the tile. Component z. [(x, y, z)] [Unit: wu] */
        public function get bminZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 8);
        }

        public function set bminZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 8, value);
        }

        /** The maximum bounds of the tile. Component x. [(x, y, z)] [Unit: wu] */
        public function get bmaxX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX);
        }

        public function set bmaxX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX, value);
        }

        /** The maximum bounds of the tile. Component y. [(x, y, z)] [Unit: wu] */
        public function get bmaxY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 4);
        }

        public function set bmaxY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 4, value);
        }

        /** The maximum bounds of the tile. Component z. [(x, y, z)] [Unit: wu] */
        public function get bmaxZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 8);
        }

        public function set bmaxZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 8, value);
        }

        /** The agent height. [Unit: wu] */
        public function get walkableHeight():Number
        {
            return CModule.readFloat(ptr + OFFSET_WALKABLE_HEIGHT);
        }

        public function set walkableHeight(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WALKABLE_HEIGHT, value);
        }

        /** The agent radius. [Unit: wu] */
        public function get walkableRadius():Number
        {
            return CModule.readFloat(ptr + OFFSET_WALKABLE_RADIUS);
        }

        public function set walkableRadius(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WALKABLE_RADIUS, value);
        }

        /** The agent maximum traversable ledge. (Up/Down) [Unit: wu] */
        public function get walkableClimb():Number
        {
            return CModule.readFloat(ptr + OFFSET_WALKABLE_CLIMB);
        }

        public function set walkableClimb(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WALKABLE_CLIMB, value);
        }

        /** The xz-plane cell size of the polygon mesh. [Limit: > 0] [Unit: wu] */
        public function get cs():Number
        {
            return CModule.readFloat(ptr + OFFSET_CS);
        }

        public function set cs(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CS, value);
        }

        /** The y-axis cell height of the polygon mesh. [Limit: > 0] [Unit: wu] */
        public function get ch():Number
        {
            return CModule.readFloat(ptr + OFFSET_CH);
        }

        public function set ch(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CH, value);
        }

        /** True if a bounding volume tree should be built for the tile. */
        public function get buildBvTree():Boolean
        {
            return CModule.read8(ptr + OFFSET_BUILD_BV_TREE);
        }

        public function set buildBvTree(value:Boolean):void
        {
            CModule.write8(ptr + OFFSET_BUILD_BV_TREE, value ? 1 : 0);
        }

        public function initFromRecast(cfg:RCConfig, pmesh:RCPolyMesh, dmesh:RCPolyMeshDetail):void
        {
            CModule.write32(ptr + OFFSET_CS, CModule.read32(cfg.ptr + RCConfig.OFFSET_CS));
            CModule.write32(ptr + OFFSET_CH, CModule.read32(cfg.ptr + RCConfig.OFFSET_CH));
            CModule.write32(ptr + OFFSET_VERTS, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_VERTS));
            CModule.write32(ptr + OFFSET_VERT_COUNT, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_NVERTS));
            CModule.write32(ptr + OFFSET_POLYS, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_POLYS));
            CModule.write32(ptr + OFFSET_POLY_AREAS, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_AREAS));
            CModule.write32(ptr + OFFSET_POLY_FLAGS, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_FLAGS));
            CModule.write32(ptr + OFFSET_POLY_COUNT, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_NPOLYS));
            CModule.write32(ptr + OFFSET_NVP, CModule.read32(pmesh.ptr + RCPolyMesh.OFFSET_NVP));
            copyBytes(pmesh.ptr + RCPolyMesh.OFFSET_BMIN, ptr + OFFSET_BMIN, 12);
            copyBytes(pmesh.ptr + RCPolyMesh.OFFSET_BMAX, ptr + OFFSET_BMAX, 12);
            CModule.write32(ptr + OFFSET_DETAIL_MESHES, CModule.read32(dmesh.ptr + RCPolyMeshDetail.OFFSET_MESHES));
            CModule.write32(ptr + OFFSET_DETAIL_VERTS, CModule.read32(dmesh.ptr + RCPolyMeshDetail.OFFSET_VERTS));
            CModule.write32(ptr + OFFSET_DETAIL_VERTS_COUNT,
                            CModule.read32(dmesh.ptr + RCPolyMeshDetail.OFFSET_NVERTS));
            CModule.write32(ptr + OFFSET_DETAIL_TRIS, CModule.read32(dmesh.ptr + RCPolyMeshDetail.OFFSET_TRIS));
            CModule.write32(ptr + OFFSET_DETAIL_TRI_COUNT, CModule.read32(dmesh.ptr + RCPolyMeshDetail.OFFSET_NTRIS));
        }

        public override function alloc():Boolean
        {
            ptr = internal_dtAlloc_dtNavMeshCreateParams();
            setBytes(ptr, 0, SIZE);
            return ptr != 0;
        }

        public override function free():void
        {
            internal_dtFree(ptr);
            ptr = 0;
        }
    }
}