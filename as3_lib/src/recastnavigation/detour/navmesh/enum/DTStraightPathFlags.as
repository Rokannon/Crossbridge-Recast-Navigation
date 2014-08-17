package recastnavigation.detour.navmesh.enum
{
    /**
     * Vertex flags returned by dtNavMeshQuery::findStraightPath.
     **/
    public class DTStraightPathFlags
    {
        /** The vertex is the start position in the path. */
        public static const DT_STRAIGHTPATH_START:int = 0x01;
        /** The vertex is the end position in the path. */
        public static const DT_STRAIGHTPATH_END:int = 0x02;
        /** The vertex is the start of an off-mesh connection. */
        public static const DT_STRAIGHTPATH_OFFMESH_CONNECTION:int = 0x04;
    }
}