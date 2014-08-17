package recastnavigation.detour.crowd.enum
{
    /**
     * Crowd agent update flags.
     */
    public class DTCrowdUpdateFlags
    {
        public static const DT_CROWD_ANTICIPATE_TURNS:int = 1 << 0;
        public static const DT_CROWD_OBSTACLE_AVOIDANCE:int = 1 << 1;
        public static const DT_CROWD_SEPARATION:int = 1 << 2;
        /** Use #dtPathCorridor::optimizePathVisibility() to optimize the agent path. */
        public static const DT_CROWD_OPTIMIZE_VIS:int = 1 << 3;
        /** Use dtPathCorridor::optimizePathTopology() to optimize the agent path. */
        public static const DT_CROWD_OPTIMIZE_TOPO:int = 1 << 4;
    }
}