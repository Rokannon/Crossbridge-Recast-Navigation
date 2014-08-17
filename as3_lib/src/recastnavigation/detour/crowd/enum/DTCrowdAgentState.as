package recastnavigation.detour.crowd.enum
{
    /**
     * The type of navigation mesh polygon the agent is currently traversing.
     */
    public class DTCrowdAgentState
    {
        /** The agent is not in a valid state. */
        public static const DT_CROWDAGENT_STATE_INVALID:int = 0;
        /** The agent is traversing a normal navigation mesh polygon. */
        public static const DT_CROWDAGENT_STATE_WALKING:int = 1;
        /** The agent is traversing an off-mesh connection. */
        public static const DT_CROWDAGENT_STATE_OFFMESH:int = 2;
    }
}