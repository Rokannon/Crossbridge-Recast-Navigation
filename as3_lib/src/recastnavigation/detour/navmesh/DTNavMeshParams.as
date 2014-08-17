package recastnavigation.detour.navmesh
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.internal_api.CModule;

    use namespace rn_internal;

    /**
     * Configuration parameters used to define multi-tile navigation
     * meshes. The values are used to allocate space during the
     * initialization of a navigation mesh.
     */
    public class DTNavMeshParams extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_ORIG:int = offset(12);
        rn_internal static const OFFSET_TILE_WIDTH:int = offset(4);
        rn_internal static const OFFSET_TILE_HEIGHT:int = offset(4);
        rn_internal static const OFFSET_MAX_TILES:int = offset(4);
        rn_internal static const OFFSET_MAX_POLYS:int = offset(4);

        private static function offset(size:int):int
        {
            return (SIZE += size) - size;
        }

        /** The world space origin of the navigation mesh's tile space. Component x. [(x, y, z)] */
        public function get origX():Number
        {
            return CModule.readFloat(ptr + OFFSET_ORIG);
        }

        public function set origX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_ORIG, value);
        }

        /** The world space origin of the navigation mesh's tile space. Component y. [(x, y, z)] */
        public function get origY():Number
        {
            return CModule.readFloat(ptr + OFFSET_ORIG + 4);
        }

        public function set origY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_ORIG + 4, value);
        }

        /** The world space origin of the navigation mesh's tile space. Component z. [(x, y, z)] */
        public function get origZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_ORIG + 8);
        }

        public function set origZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_ORIG + 8, value);
        }

        /** The width of each tile. (Along the x-axis.) */
        public function get tileWidth():Number
        {
            return CModule.readFloat(ptr + OFFSET_TILE_WIDTH);
        }

        public function set tileWidth(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TILE_WIDTH, value);
        }

        /** The height of each tile. (Along the z-axis.) */
        public function get tileHeight():Number
        {
            return CModule.readFloat(ptr + OFFSET_TILE_HEIGHT);
        }

        public function set tileHeight(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_TILE_HEIGHT, value);
        }

        /** The maximum number of tiles the navigation mesh can contain. */
        public function get maxTiles():int
        {
            return CModule.read32(ptr + OFFSET_MAX_TILES);
        }

        public function set maxTiles(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAX_TILES, value);
        }

        /** The maximum number of polygons each tile can contain. */
        public function get maxPolys():int
        {
            return CModule.read32(ptr + OFFSET_MAX_POLYS);
        }

        public function set maxPolys(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAX_POLYS, value);
        }
    }
}