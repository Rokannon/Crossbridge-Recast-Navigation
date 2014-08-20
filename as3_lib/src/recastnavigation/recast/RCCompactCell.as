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
     * Provides information on the content of a cell column in a compact heightfield.
     */
    public class RCCompactCell extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_UNION:int = offsetBytes(4, RCCompactCell);

        /** Index to the first span in the column. */
        public function get index():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 0, 24);
        }

        public function set index(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 0, 24, value));
        }

        /** Number of spans in the column. */
        public function get count():int
        {
            return readBits(CModule.read32(ptr + OFFSET_UNION), 24, 8);
        }

        public function set count(value:int):void
        {
            CModule.write32(ptr + OFFSET_UNION, writeBits(CModule.read32(ptr + OFFSET_UNION), 24, 8, value));
        }
    }
}