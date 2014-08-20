package recastnavigation.detour.navmesh
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Defines a link between polygons.
     */
    public class DTLink extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_REF:int = offsetBytes(4, DTLink);
        rn_internal static const OFFSET_NEXT:int = offsetBytes(4, DTLink);
        rn_internal static const OFFSET_EDGE:int = offsetBytes(1, DTLink);
        rn_internal static const OFFSET_SIDE:int = offsetBytes(1, DTLink);
        rn_internal static const OFFSET_BMIN:int = offsetBytes(1, DTLink);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(1, DTLink);

        /** Neighbour reference. (The neighbor that is linked to.) */
        public function get ref():int
        {
            return CModule.read32(ptr + OFFSET_REF);
        }

        public function set ref(value:int):void
        {
            CModule.write32(ptr + OFFSET_REF, value);
        }

        /** Index of the next link. */
        public function get next():int
        {
            return CModule.read32(ptr + OFFSET_NEXT);
        }

        public function set next(value:int):void
        {
            CModule.write32(ptr + OFFSET_NEXT, value);
        }

        /** Index of the polygon edge that owns this link. */
        public function get edge():int
        {
            return CModule.read8(ptr + OFFSET_EDGE);
        }

        public function set edge(value:int):void
        {
            CModule.write8(ptr + OFFSET_EDGE, value);
        }

        /** If a boundary link, defines on which side the link is. */
        public function get side():int
        {
            return CModule.read8(ptr + OFFSET_SIDE);
        }

        public function set side(value:int):void
        {
            CModule.write8(ptr + OFFSET_SIDE, value);
        }

        /** If a boundary link, defines the minimum sub-edge area. */
        public function get bmin():int
        {
            return CModule.read8(ptr + OFFSET_BMIN);
        }

        public function set bmin(value:int):void
        {
            CModule.write8(ptr + OFFSET_BMIN, value);
        }

        /** If a boundary link, defines the maximum sub-edge area. */
        public function get bmax():int
        {
            return CModule.read8(ptr + OFFSET_BMAX);
        }

        public function set bmax(value:int):void
        {
            CModule.write8(ptr + OFFSET_BMAX, value);
        }
    }
}