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
     * Represents a span in a heightfield.
     */
    public class RCSpan extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_UNION:int = offsetBytes(4, RCSpan);
        rn_internal static const OFFSET_NEXT:int = offsetBytes(4, RCSpan);

        /** The lower limit of the span. [Limit: < #smax] */
        public function get smin():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 0, 13);
        }

        public function set smin(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 0, 13, value));
        }

        /** The upper limit of the span. [Limit: <= #RC_SPAN_MAX_HEIGHT] */
        public function get smax():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 13, 13);
        }

        public function set smax(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 13, 13, value));
        }

        /** The area id assigned to the span. */
        public function get area():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 26, 6);
        }

        public function set area(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 26, 6, value));
        }

        /** The next span higher up in column. Getter. */
        public function getNext(resultSpan:RCSpan = null):RCSpan
        {
            if (resultSpan == null)
            {
                resultSpan = new RCSpan();
            }
            resultSpan.ptr = CModule.read32(ptr + OFFSET_NEXT);
            return resultSpan;
        }

        /** The next span higher up in column. Setter. */
        public function setNext(value:RCSpan):void
        {
            CModule.write32(ptr + OFFSET_NEXT, value.ptr);
        }
    }
}