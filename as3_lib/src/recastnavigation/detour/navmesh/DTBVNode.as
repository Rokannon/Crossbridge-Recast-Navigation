package recastnavigation.detour.navmesh
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Bounding volume node.
     */
    public class DTBVNode extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_BMIN:int = offsetBytes(6, DTBVNode);
        rn_internal static const OFFSET_BMAX:int = offsetBytes(6, DTBVNode);
        rn_internal static const OFFSET_I:int = offsetBytes(4, DTBVNode);

        /** Minimum bounds of the node's AABB. Component x. [(x, y, z)] */
        public function get bminX():int
        {
            return CModule.read16(ptr + OFFSET_BMIN);
        }

        public function set bminX(value:int):void
        {
            CModule.write16(ptr + OFFSET_BMIN, value);
        }

        /** Minimum bounds of the node's AABB. Component y. [(x, y, z)] */
        public function get bminY():int
        {
            return CModule.read16(ptr + OFFSET_BMIN + 2);
        }

        public function set bminY(value:int):void
        {
            CModule.write16(ptr + OFFSET_BMIN + 2, value);
        }

        /** Minimum bounds of the node's AABB. Component z. [(x, y, z)] */
        public function get bminZ():int
        {
            return CModule.read16(ptr + OFFSET_BMIN + 4);
        }

        public function set bminZ(value:int):void
        {
            CModule.write16(ptr + OFFSET_BMIN + 4, value);
        }

        /** Maximum bounds of the node's AABB. Component x. [(x, y, z)] */
        public function get bmaxX():int
        {
            return CModule.read16(ptr + OFFSET_BMAX);
        }

        public function set bmaxX(value:int):void
        {
            CModule.write16(ptr + OFFSET_BMAX, value);
        }

        /** Maximum bounds of the node's AABB. Component y. [(x, y, z)] */
        public function get bmaxY():int
        {
            return CModule.read16(ptr + OFFSET_BMAX + 2);
        }

        public function set bmaxY(value:int):void
        {
            CModule.write16(ptr + OFFSET_BMAX + 2, value);
        }

        /** Maximum bounds of the node's AABB. Component z. [(x, y, z)] */
        public function get bmaxZ():int
        {
            return CModule.read16(ptr + OFFSET_BMAX + 4);
        }

        public function set bmaxZ(value:int):void
        {
            CModule.write16(ptr + OFFSET_BMAX + 4, value);
        }

        /** The node's index. (Negative for escape sequence.) */
        public function get i():int
        {
            return CModule.read32(ptr + OFFSET_I);
        }

        public function set i(value:int):void
        {
            CModule.write32(ptr + OFFSET_I, value);
        }
    }
}