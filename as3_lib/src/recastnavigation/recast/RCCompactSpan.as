package recastnavigation.recast
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.core.utils.readBits;
    import recastnavigation.core.utils.writeBits;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Represents a span of unobstructed space within a compact heightfield.
     */
    public class RCCompactSpan extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_Y:int = offsetBytes(4, RCCompactSpan);
        rn_internal static const OFFSET_REG:int = offsetBytes(4, RCCompactSpan);
        rn_internal static const OFFSET_UNION:int = offsetBytes(4, RCCompactSpan);

        /** The lower extent of the span. (Measured from the heightfield's base.) */
        public function get y():int
        {
            return CModule.read32(ptr + OFFSET_Y);
        }

        public function set y(value:int):void
        {
            CModule.write32(ptr + OFFSET_Y, value);
        }

        /** The id of the region the span belongs to. (Or zero if not in a region.) */
        public function get reg():int
        {
            return CModule.read32(ptr + OFFSET_REG);
        }

        public function set reg(value:int):void
        {
            CModule.write32(ptr + OFFSET_REG, value);
        }

        /** Packed neighbor connection data. */
        public function get con():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 0, 24);
        }

        public function set con(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 0, 24, value));
        }

        /** The height of the span.  (Measured from #y.) */
        public function get h():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 24, 8);
        }

        public function set h(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 24, 8, value));
        }
    }
}