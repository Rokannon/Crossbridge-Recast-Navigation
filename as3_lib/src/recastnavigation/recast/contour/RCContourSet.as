package recastnavigation.recast.contour
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.copyBytes;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcAllocContourSet;
    import recastnavigation.internal_api.internal_rcFreeContourSet;

    use namespace rn_internal;

    /**
     * Represents a group of related contours.
     */
    public class RCContourSet extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_CONTS:int = offsetBytes(4, RCContourSet);
        rn_internal static const OFFSET_NCONTS:int = offsetBytes(4, RCContourSet);
        rn_internal static const OFFSET_BMIN:int = offsetBytes(12, RCContourSet);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(12, RCContourSet);
        rn_internal static const OFFSET_CS:int = offsetBytes(4, RCContourSet);
        rn_internal static const OFFSET_CH:int = offsetBytes(4, RCContourSet);
        rn_internal static const OFFSET_WIDTH:int = offsetBytes(4, RCContourSet);
        rn_internal static const OFFSET_HEIGHT:int = offsetBytes(4, RCContourSet);
        rn_internal static const OFFSET_BORDER_SIZE:int = offsetBytes(4, RCContourSet);

        /** An array of the contours in the set. Getter. */
        public function getCont(index:int, resultContour:RCContour = null):RCContour
        {
            if (resultContour == null)
            {
                resultContour = new RCContour();
            }
            resultContour.ptr = CModule.read32(ptr + OFFSET_CONTS) + RCContour.SIZE * index;
            return resultContour;
        }

        /** An array of the contours in the set. Setter. */
        public function setCont(index:int, value:RCContour):void
        {
            copyBytes(value.ptr, CModule.read32(ptr + OFFSET_CONTS) + RCContour.SIZE * index, RCContour.SIZE);
        }

        /** The number of contours in the set. */
        public function get nconts():int
        {
            return CModule.read32(ptr + OFFSET_NCONTS);
        }

        public function set nconts(value:int):void
        {
            CModule.write32(ptr + OFFSET_NCONTS, value);
        }

        /** The minimum bounds in world space. Component x. [(x, y, z)] [Units: wu] */
        public function get bminX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN);
        }

        public function set bminX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN, value);
        }

        /** The minimum bounds in world space. Component y. [(x, y, z)] [Units: wu] */
        public function get bminY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 4);
        }

        public function set bminY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 4, value);
        }

        /** The minimum bounds in world space. Component z. [(x, y, z)] [Units: wu] */
        public function get bminZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 8);
        }

        public function set bminZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 8, value);
        }

        /** The maximum bounds in world space. Component x. [(x, y, z)] [Units: wu] */
        public function get bmaxX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX);
        }

        public function set bmaxX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX, value);
        }

        /** The maximum bounds in world space. Component y. [(x, y, z)] [Units: wu] */
        public function get bmaxY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 4);
        }

        public function set bmaxY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 4, value);
        }

        /** The maximum bounds in world space. Component z. [(x, y, z)] [Units: wu] */
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

        /** The width of the set. (Along the x-axis in cell units.) */
        public function get width():int
        {
            return CModule.read32(ptr + OFFSET_WIDTH);
        }

        public function set width(value:int):void
        {
            CModule.write32(ptr + OFFSET_WIDTH, value);
        }

        /** The height of the set. (Along the z-axis in cell units.) */
        public function get height():int
        {
            return CModule.read32(ptr + OFFSET_HEIGHT);
        }

        public function set height(value:int):void
        {
            CModule.write32(ptr + OFFSET_HEIGHT, value);
        }

        /** The AABB border size used to generate the source data from which the contours were derived. */
        public function get borderSize():int
        {
            return CModule.read32(ptr + OFFSET_BORDER_SIZE);
        }

        public function set borderSize(value:int):void
        {
            CModule.write32(ptr + OFFSET_BORDER_SIZE, value);
        }

        public override function alloc():Boolean
        {
            ptr = internal_rcAllocContourSet();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_rcFreeContourSet(ptr);
            ptr = 0;
        }
    }
}