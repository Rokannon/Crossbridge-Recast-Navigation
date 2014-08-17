package recastnavigation.detour.navmesh.enum
{
    /**
     * Flags representing the type of a navigation mesh polygon.
     */
    public class DTPolyTypes
    {
        /** The polygon is a standard convex polygon that is part of the surface of the mesh. */
        public static const DT_POLYTYPE_GROUND:int = 0;
        /** The polygon is an off-mesh connection consisting of two vertices. */
        public static const DT_POLYTYPE_OFFMESH_CONNECTION:int = 1;
    }
}