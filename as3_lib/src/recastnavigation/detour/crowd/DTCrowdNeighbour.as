package recastnavigation.detour.crowd
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Provides neighbor data for agents managed by the crowd.
     */
    public class DTCrowdNeighbour extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_IDX:int = offsetBytes(4, DTCrowdNeighbour);
        rn_internal static const OFFSET_DIST:int = offsetBytes(4, DTCrowdNeighbour);

        /** The index of the neighbor in the crowd. */
        public function get idx():int
        {
            return CModule.read32(ptr + OFFSET_IDX);
        }

        public function set idx(value:int):void
        {
            CModule.write32(ptr + OFFSET_IDX, value);
        }

        /** The distance between the current agent and the neighbor. */
        public function get dist():Number
        {
            return CModule.readFloat(ptr + OFFSET_DIST);
        }

        public function set dist(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DIST, value);
        }
    }
}