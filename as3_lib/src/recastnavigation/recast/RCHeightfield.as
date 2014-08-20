package recastnavigation.recast
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.copyBytes;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcAllocHeightfield;
    import recastnavigation.internal_api.internal_rcFreeHeightField;

    use namespace rn_internal;

    /**
     * A dynamic heightfield representing obstructed space.
     */
    public class RCHeightfield extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_WIDTH:int = offsetBytes(4, RCHeightfield);
        rn_internal static const OFFSET_HEIGHT:int = offsetBytes(4, RCHeightfield);
        rn_internal static const OFFSET_BMIN:int = offsetBytes(12, RCHeightfield);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(12, RCHeightfield);
        rn_internal static const OFFSET_CS:int = offsetBytes(4, RCHeightfield);
        rn_internal static const OFFSET_CH:int = offsetBytes(4, RCHeightfield);
        rn_internal static const OFFSET_SPANS:int = offsetBytes(4, RCHeightfield);
        rn_internal static const OFFSET_POOLS:int = offsetBytes(4, RCHeightfield);
        rn_internal static const OFFSET_FREELIST:int = offsetBytes(4, RCHeightfield);

        /** The width of the heightfield. (Along the x-axis in cell units.) */
        public function get width():int
        {
            return CModule.read32(ptr + OFFSET_WIDTH);
        }

        public function set width(value:int):void
        {
            CModule.write32(ptr + OFFSET_WIDTH, value);
        }

        /** The height of the heightfield. (Along the z-axis in cell units.) */
        public function get height():int
        {
            return CModule.read32(ptr + OFFSET_HEIGHT);
        }

        public function set height(value:int):void
        {
            CModule.write32(ptr + OFFSET_HEIGHT, value);
        }

        /** The minimum bounds in world space. Component x. [(x, y, z)] */
        public function get bminX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN);
        }

        public function set bminX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN, value);
        }

        /** The minimum bounds in world space. Component y. [(x, y, z)] */
        public function get bminY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 4);
        }

        public function set bminY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 4, value);
        }

        /** The minimum bounds in world space. Component z. [(x, y, z)] */
        public function get bminZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 8);
        }

        public function set bminZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 8, value);
        }

        /** The maximum bounds in world space. Component x. [(x, y, z)] */
        public function get bmaxX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX);
        }

        public function set bmaxX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX, value);
        }

        /** The maximum bounds in world space. Component y. [(x, y, z)] */
        public function get bmaxY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 4);
        }

        public function set bmaxY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 4, value);
        }

        /** The maximum bounds in world space. Component z. [(x, y, z)] */
        public function get bmaxZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 8);
        }

        public function set bmaxZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 8, value);
        }

        /** The size of each cell. (On the xz-plane.) */
        public function get cs():Number
        {
            return CModule.readFloat(ptr + OFFSET_CS);
        }

        public function set cs(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CS, value);
        }

        /** The height of each cell. (The minimum increment along the y-axis.) */
        public function get ch():Number
        {
            return CModule.readFloat(ptr + OFFSET_CH);
        }

        public function set ch(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CH, value);
        }

        /** Heightfield of spans (width*height). Getter. */
        public function getSpan(index:int, resultSpan:RCSpan = null):RCSpan
        {
            if (resultSpan == null)
            {
                resultSpan = new RCSpan();
            }
            resultSpan.ptr = CModule.read32(CModule.read32(ptr + OFFSET_SPANS) + RCSpan.SIZE * index);
            return resultSpan;
        }

        /** Heightfield of spans (width*height). Setter. */
        public function setSpan(index:int, value:RCSpan):void
        {
            copyBytes(value.ptr, CModule.read32(ptr + OFFSET_SPANS) + RCSpan.SIZE * index, RCSpan.SIZE);
        }

        /** Linked list of span pools. Getter. */
        public function getPools(resultSpanPool:RCSpanPool = null):RCSpanPool
        {
            if (resultSpanPool == null)
            {
                resultSpanPool = new RCSpanPool();
            }
            resultSpanPool.ptr = CModule.read32(ptr + OFFSET_POOLS);
            return resultSpanPool;
        }

        /** Linked list of span pools. Setter. */
        public function setPools(value:RCSpanPool):void
        {
            CModule.write32(ptr + OFFSET_POOLS, value.ptr);
        }

        /** The next free span. Getter. */
        public function getFreelist(resultSpan:RCSpan = null):RCSpan
        {
            if (resultSpan == null)
            {
                resultSpan = new RCSpan();
            }
            resultSpan.ptr = CModule.read32(ptr + OFFSET_FREELIST);
            return resultSpan;
        }

        /** The next free span. Setter. */
        public function setFreelist(value:RCSpan):void
        {
            CModule.write32(ptr + OFFSET_FREELIST, value.ptr);
        }

        public override function alloc():Boolean
        {
            ptr = internal_rcAllocHeightfield();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_rcFreeHeightField(ptr);
            ptr = 0;
        }
    }
}