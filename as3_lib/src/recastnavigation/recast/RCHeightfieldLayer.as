package recastnavigation.recast
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Represents a heightfield layer within a layer set.
     */
    public class RCHeightfieldLayer extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_BMIN:int = offsetBytes(12, RCHeightfieldLayer);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(12, RCHeightfieldLayer);
        rn_internal static const OFFSET_CS:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_CH:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_WIDTH:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_HEIGHT:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_MINX:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_MAXX:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_MINY:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_MAXY:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_HMIN:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_HMAX:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_HEIGHTS:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_AREAS:int = offsetBytes(4, RCHeightfieldLayer);
        rn_internal static const OFFSET_CONS:int = offsetBytes(4, RCHeightfieldLayer);

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

        /** The minimum x-bounds of usable data. */
        public function get minx():int
        {
            return CModule.read32(ptr + OFFSET_MINX);
        }

        public function set minx(value:int):void
        {
            CModule.write32(ptr + OFFSET_MINX, value);
        }

        /** The maximum x-bounds of usable data. */
        public function get maxx():int
        {
            return CModule.read32(ptr + OFFSET_MAXX);
        }

        public function set maxx(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAXX, value);
        }

        /** The minimum y-bounds of usable data. (Along the z-axis.) */
        public function get miny():int
        {
            return CModule.read32(ptr + OFFSET_MINY);
        }

        public function set miny(value:int):void
        {
            CModule.write32(ptr + OFFSET_MINY, value);
        }

        /** The maximum y-bounds of usable data. (Along the z-axis.) */
        public function get maxy():int
        {
            return CModule.read32(ptr + OFFSET_MAXY);
        }

        public function set maxy(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAXY, value);
        }

        /** The minimum height bounds of usable data. (Along the y-axis.) */
        public function get hmin():int
        {
            return CModule.read32(ptr + OFFSET_HMIN);
        }

        public function set hmin(value:int):void
        {
            CModule.write32(ptr + OFFSET_HMIN, value);
        }

        /** The maximum height bounds of usable data. (Along the y-axis.) */
        public function get hmax():int
        {
            return CModule.read32(ptr + OFFSET_HMAX);
        }

        public function set hmax(value:int):void
        {
            CModule.write32(ptr + OFFSET_HMAX, value);
        }

        /** The heightfield. Getter. [Size: width * height] */
        public function getHeight(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_HEIGHTS) + 1 * index);
        }

        /** The heightfield. Setter. [Size: width * height] */
        public function setHeight(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_HEIGHTS) + 1 * index, value);
        }

        /** Area ids. Getter. [Size: Same as #heights] */
        public function getArea(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_AREAS) + 1 * index);
        }

        /** Area ids. Getter. [Size: Same as #heights] */
        public function setArea(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_AREAS) + 1 * index, value);
        }

        /** Packed neighbor connection information. Getter. [Size: Same as #heights] */
        public function getCon(index:int):int
        {
            return CModule.read8(CModule.read32(ptr + OFFSET_CONS) + 1 * index);
        }

        /** Packed neighbor connection information. Setter. [Size: Same as #heights] */
        public function setCon(index:int, value:int):void
        {
            CModule.write8(CModule.read32(ptr + OFFSET_CONS) + 1 * index, value);
        }
    }
}