package recastnavigation.detour.navmesh
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.offsetBytes;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Defines an navigation mesh off-mesh connection within a dtMeshTile
     * object. An off-mesh connection is a user defined traversable
     * connection made up to two vertices.
     */
    public class DTOffMeshConnection extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_POS:int = offsetBytes(4 * 6, DTOffMeshConnection);
        rn_internal static const OFFSET_RAD:int = offsetBytes(4, DTOffMeshConnection);
        rn_internal static const OFFSET_POLY:int = offsetBytes(2, DTOffMeshConnection);
        rn_internal static const OFFSET_FLAGS:int = offsetBytes(1, DTOffMeshConnection);
        rn_internal static const OFFSET_SIDE:int = offsetBytes(1, DTOffMeshConnection);
        rn_internal static const OFFSET_USER_ID:int = offsetBytes(4, DTOffMeshConnection);

        /** The endpoints of the connection. Component ax. [(ax, ay, az, bx, by, bz)] */
        public function get posAX():Number
        {
            return CModule.readFloat(ptr + OFFSET_POS);
        }

        public function set posAX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_POS, value);
        }

        /** The endpoints of the connection. Component ay. [(ax, ay, az, bx, by, bz)] */
        public function get posAY():Number
        {
            return CModule.readFloat(ptr + OFFSET_POS + 4);
        }

        public function set posAY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_POS + 4, value);
        }

        /** The endpoints of the connection. Component az. [(ax, ay, az, bx, by, bz)] */
        public function get posAZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_POS + 8);
        }

        public function set posAZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_POS + 8, value);
        }

        /** The endpoints of the connection. Component bx. [(ax, ay, az, bx, by, bz)] */
        public function get posBX():Number
        {
            return CModule.readFloat(ptr + OFFSET_POS + 12);
        }

        public function set posBX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_POS + 12, value);
        }

        /** The endpoints of the connection. Component by. [(ax, ay, az, bx, by, bz)] */
        public function get posBY():Number
        {
            return CModule.readFloat(ptr + OFFSET_POS + 16);
        }

        public function set posBY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_POS + 16, value);
        }

        /** The endpoints of the connection. Component bz. [(ax, ay, az, bx, by, bz)] */
        public function get posBZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_POS + 20);
        }

        public function set posBZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_POS + 20, value);
        }

        /** The radius of the endpoints. [Limit: >= 0] */
        public function get rad():Number
        {
            return CModule.readFloat(ptr + OFFSET_RAD);
        }

        public function set rad(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_RAD, value);
        }

        /** The polygon reference of the connection within the tile. */
        public function get poly():int
        {
            return CModule.read16(ptr + OFFSET_POLY);
        }

        public function set poly(value:int):void
        {
            CModule.write16(ptr + OFFSET_POLY, value);
        }

        /**
         * Link flags. These are not the connection's user defined flags.
         * Those are assigned via the connection's dtPoly definition.
         * These are link flags used for internal purposes.
         */
        public function get flags():int
        {
            return CModule.read8(ptr + OFFSET_FLAGS);
        }

        public function set flags(value:int):void
        {
            CModule.write8(ptr + OFFSET_FLAGS, value);
        }

        /** End point side. */
        public function get side():int
        {
            return CModule.read8(ptr + OFFSET_SIDE);
        }

        public function set side(value:int):void
        {
            CModule.write8(ptr + OFFSET_SIDE, value);
        }

        /** The id of the offmesh connection. (User assigned when the navigation mesh is built.) */
        public function get userId():int
        {
            return CModule.read32(ptr + OFFSET_USER_ID);
        }

        public function set userId(value:int):void
        {
            CModule.write32(ptr + OFFSET_USER_ID, value);
        }
    }
}