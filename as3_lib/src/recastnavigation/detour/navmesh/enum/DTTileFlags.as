package recastnavigation.detour.navmesh.enum
{
    /**
     * Tile flags used for various functions and fields.
     * For an example, see dtNavMesh::addTile().
     */
    public class DTTileFlags
    {
        /** The navigation mesh owns the tile memory and is responsible for freeing it. */
        public static const DT_TILE_FREE_DATA:int = 0x01;
    }
}