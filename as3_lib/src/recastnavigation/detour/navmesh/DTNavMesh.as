package recastnavigation.detour.navmesh
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.mallocInt8Vector;
    import recastnavigation.internal_api.internal_dtAllocNavMesh;
    import recastnavigation.internal_api.internal_dtFreeNavMesh;
    import recastnavigation.internal_api.internal_dtNavMesh_getPolyRefBase;
    import recastnavigation.internal_api.internal_dtNavMesh_getTileAt;
    import recastnavigation.internal_api.internal_dtNavMesh_init;

    use namespace rn_internal;

    /** A navigation mesh based on tiles of convex polygons. */
    public class DTNavMesh extends RNBase
    {
        /** The maximum number of vertices per navigation polygon. */
        public static const DT_VERTS_PER_POLYGON:int = 6;
        /** The maximum number of user defined area ids. */
        public static const DT_MAX_AREAS:int = 64;

        /** Initializes the navigation mesh for single tile use. */
        public function init(data:Vector.<int>, flags:int):int
        {
            var data_ptr:int = mallocInt8Vector(data);
            var result:int = internal_dtNavMesh_init(ptr, data_ptr, data.length, flags);
            return result;
        }

        /** Gets the tile at the specified grid location. */
        public function getTileAt(x:int, y:int, layer:int, resultTile:DTMeshTile = null):DTMeshTile
        {
            if (resultTile == null)
                resultTile = new DTMeshTile();
            resultTile.ptr = internal_dtNavMesh_getTileAt(ptr, x, y, layer);
            return resultTile;
        }

        /** Gets the polygon reference for the tile's base polygon. */
        public function getPolyRefBase(tile:DTMeshTile):int
        {
            return internal_dtNavMesh_getPolyRefBase(ptr, tile.ptr);
        }

        public override function alloc():Boolean
        {
            ptr = internal_dtAllocNavMesh();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_dtFreeNavMesh(ptr);
            ptr = 0;
        }
    }
}