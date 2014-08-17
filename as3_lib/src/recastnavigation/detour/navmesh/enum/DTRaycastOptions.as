package recastnavigation.detour.navmesh.enum
{
    /**
     * Options for dtNavMeshQuery::raycast
     */
    public class DTRaycastOptions
    {
        /** Raycast should calculate movement cost along the ray and fill RaycastHit::cost */
        public static const DT_RAYCAST_USE_COSTS:int = 0x01;
    }
}