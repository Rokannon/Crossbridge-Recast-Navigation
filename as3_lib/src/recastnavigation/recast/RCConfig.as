package recastnavigation.recast
{
    import recastnavigation.core.RNBase;
    import recastnavigation.core.rn_internal;
    import recastnavigation.core.utils.mallocNumberVector;
    import recastnavigation.internal_api.CModule;
    import recastnavigation.internal_api.internal_rcAlloc_rcConfig;
    import recastnavigation.internal_api.internal_rcCalcBounds;
    import recastnavigation.internal_api.internal_rcCalcGridSize;
    import recastnavigation.internal_api.internal_rcFree;

    use namespace rn_internal;

    /**
     * Specifies a configuration to use when performing Recast builds.
     */
    public class RCConfig extends RNBase
    {
        rn_internal static var SIZE:int = 0;
        rn_internal static const OFFSET_WIDTH:int = offset(4);
        rn_internal static const OFFSET_HEIGHT:int = offset(4);
        rn_internal static const OFFSET_TILE_SIZE:int = offset(4);
        rn_internal static const OFFSET_BORDER_SIZE:int = offset(4);
        rn_internal static const OFFSET_CS:int = offset(4);
        rn_internal static const OFFSET_CH:int = offset(4);
        rn_internal static const OFFSET_BMIN:int = offset(12);
        rn_internal static const OFFSET_BMAX:int = offset(12);
        rn_internal static const OFFSET_WALKABLE_SLOPE_ANGLE:int = offset(4);
        rn_internal static const OFFSET_WALKABLE_HEIGHT:int = offset(4);
        rn_internal static const OFFSET_WALKABLE_CLIMB:int = offset(4);
        rn_internal static const OFFSET_WALKABLE_RADIUS:int = offset(4);
        rn_internal static const OFFSET_MAX_EDGE_LEN:int = offset(4);
        rn_internal static const OFFSET_MAX_SIMPLIFICATION_ERROR:int = offset(4);
        rn_internal static const OFFSET_MIN_REGION_AREA:int = offset(4);
        rn_internal static const OFFSET_MERGE_REGION_AREA:int = offset(4);
        rn_internal static const OFFSET_MAX_VERTS_PER_POLY:int = offset(4);
        rn_internal static const OFFSET_DETAIL_SAMPLE_DIST:int = offset(4);
        rn_internal static const OFFSET_DETAIL_SAMPLE_MAX_ERROR:int = offset(4);

        private static function offset(size:int):int
        {
            return (SIZE += size) - size;
        }

        /** The width of the field along the x-axis. [Limit: >= 0] [Units: vx] */
        public function get width():int
        {
            return CModule.read32(ptr + OFFSET_WIDTH);
        }

        public function set width(value:int):void
        {
            CModule.write32(ptr + OFFSET_WIDTH, value);
        }

        /** The height of the field along the z-axis. [Limit: >= 0] [Units: vx] */
        public function get height():int
        {
            return CModule.read32(ptr + OFFSET_HEIGHT);
        }

        public function set height(value:int):void
        {
            CModule.write32(ptr + OFFSET_HEIGHT, value);
        }

        /** The width/height size of tile's on the xz-plane. [Limit: >= 0] [Units: vx] */
        public function get tileSize():int
        {
            return CModule.read32(ptr + OFFSET_TILE_SIZE);
        }

        public function set tileSize(value:int):void
        {
            CModule.write32(ptr + OFFSET_TILE_SIZE, value);
        }

        /** The size of the non-navigable border around the heightfield. [Limit: >=0] [Units: vx] */
        public function get borderSize():int
        {
            return CModule.read32(ptr + OFFSET_BORDER_SIZE);
        }

        public function set borderSize(value:int):void
        {
            CModule.write32(ptr + OFFSET_BORDER_SIZE, value);
        }

        /** The xz-plane cell size to use for fields. [Limit: > 0] [Units: wu] */
        public function get cs():Number
        {
            return CModule.readFloat(ptr + OFFSET_CS);
        }

        public function set cs(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CS, value);
        }

        /** The y-axis cell size to use for fields. [Limit: > 0] [Units: wu] */
        public function get ch():Number
        {
            return CModule.readFloat(ptr + OFFSET_CH);
        }

        public function set ch(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_CH, value);
        }

        /** The minimum bounds of the field's AABB. Component x. [(x, y, z)] [Units: wu] */
        public function get bminX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN);
        }

        public function set bminX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN, value);
        }

        /** The minimum bounds of the field's AABB. Component y. [(x, y, z)] [Units: wu] */
        public function get bminY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 4);
        }

        public function set bminY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 4, value);
        }

        /** The minimum bounds of the field's AABB. Component z. [(x, y, z)] [Units: wu] */
        public function get bminZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMIN + 8);
        }

        public function set bminZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMIN + 8, value);
        }

        /** The maximum bounds of the field's AABB. Component x. [(x, y, z)] [Units: wu] */
        public function get bmaxX():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX);
        }

        public function set bmaxX(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX, value);
        }

        /** The maximum bounds of the field's AABB. Component y. [(x, y, z)] [Units: wu] */
        public function get bmaxY():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 4);
        }

        public function set bmaxY(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 4, value);
        }

        /** The maximum bounds of the field's AABB. Component z. [(x, y, z)] [Units: wu] */
        public function get bmaxZ():Number
        {
            return CModule.readFloat(ptr + OFFSET_BMAX + 8);
        }

        public function set bmaxZ(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_BMAX + 8, value);
        }

        /** The maximum slope that is considered walkable. [Limits: 0 <= value < 90] [Units: Degrees] */
        public function get walkableSlopeAngle():Number
        {
            return CModule.readFloat(ptr + OFFSET_WALKABLE_SLOPE_ANGLE);
        }

        public function set walkableSlopeAngle(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_WALKABLE_SLOPE_ANGLE, value);
        }

        /** Minimum floor to 'ceiling' height that will still allow the floor area to be considered walkable. [Limit: >= 3] [Units: vx] */
        public function get walkableHeight():int
        {
            return CModule.read32(ptr + OFFSET_WALKABLE_HEIGHT);
        }

        public function set walkableHeight(value:int):void
        {
            CModule.write32(ptr + OFFSET_WALKABLE_HEIGHT, value);
        }

        /** Maximum ledge height that is considered to still be traversable. [Limit: >=0] [Units: vx] */
        public function get walkableClimb():int
        {
            return CModule.read32(ptr + OFFSET_WALKABLE_CLIMB);
        }

        public function set walkableClimb(value:int):void
        {
            CModule.write32(ptr + OFFSET_WALKABLE_CLIMB, value);
        }

        /** The distance to erode/shrink the walkable area of the heightfield away from obstructions.  [Limit: >=0] [Units: vx] */
        public function get walkableRadius():int
        {
            return CModule.read32(ptr + OFFSET_WALKABLE_RADIUS);
        }

        public function set walkableRadius(value:int):void
        {
            CModule.write32(ptr + OFFSET_WALKABLE_RADIUS, value);
        }

        /** The maximum allowed length for contour edges along the border of the mesh. [Limit: >=0] [Units: vx] */
        public function get maxEdgeLen():int
        {
            return CModule.read32(ptr + OFFSET_MAX_EDGE_LEN);
        }

        public function set maxEdgeLen(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAX_EDGE_LEN, value);
        }

        /** The maximum distance a simplfied contour's border edges should deviate the original raw contour. [Limit: >=0] [Units: vx] */
        public function get maxSimplificationError():Number
        {
            return CModule.readFloat(ptr + OFFSET_MAX_SIMPLIFICATION_ERROR);
        }

        public function set maxSimplificationError(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_MAX_SIMPLIFICATION_ERROR, value);
        }

        /** The minimum number of cells allowed to form isolated island areas. [Limit: >=0] [Units: vx] */
        public function get minRegionArea():int
        {
            return CModule.read32(ptr + OFFSET_MIN_REGION_AREA);
        }

        public function set minRegionArea(value:int):void
        {
            CModule.write32(ptr + OFFSET_MIN_REGION_AREA, value);
        }

        /** Any regions with a span count smaller than this value will, if possible, be merged with larger regions. [Limit: >=0] [Units: vx] */
        public function get mergeRegionArea():int
        {
            return CModule.read32(ptr + OFFSET_MERGE_REGION_AREA);
        }

        public function set mergeRegionArea(value:int):void
        {
            CModule.write32(ptr + OFFSET_MERGE_REGION_AREA, value);
        }

        /** The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process. [Limit: >= 3] */
        public function get maxVertsPerPoly():int
        {
            return CModule.read32(ptr + OFFSET_MAX_VERTS_PER_POLY);
        }

        public function set maxVertsPerPoly(value:int):void
        {
            CModule.write32(ptr + OFFSET_MAX_VERTS_PER_POLY, value);
        }

        /** Sets the sampling distance to use when generating the detail mesh. (For height detail only.) [Limits: 0 or >= 0.9] [Units: wu] */
        public function get detailSampleDist():Number
        {
            return CModule.readFloat(ptr + OFFSET_DETAIL_SAMPLE_DIST);
        }

        public function set detailSampleDist(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DETAIL_SAMPLE_DIST, value);
        }

        /** The maximum distance the detail mesh surface should deviate from heightfield data. (For height detail only.) [Limit: >=0] [Units: wu] */
        public function get detailSampleMaxError():Number
        {
            return CModule.readFloat(ptr + OFFSET_DETAIL_SAMPLE_MAX_ERROR);
        }

        public function set detailSampleMaxError(value:Number):void
        {
            CModule.writeFloat(ptr + OFFSET_DETAIL_SAMPLE_MAX_ERROR, value);
        }

        /**
         * Calculates the grid size based on the bounding box and grid cell size.
         */
        public function rcCalcGridSize():void
        {
            internal_rcCalcGridSize(ptr + OFFSET_BMIN, ptr + OFFSET_BMAX, CModule.readFloat(ptr + OFFSET_CS),
                                    ptr + OFFSET_WIDTH, ptr + OFFSET_HEIGHT);
        }

        /**
         * Calculates the bounding box of an array of vertices.
         */
        public function rcCalcBounds(verts:Vector.<Number>):void
        {
            var verts_ptr:int = mallocNumberVector(verts);
            var nv:int = verts.length / 3;
            internal_rcCalcBounds(verts_ptr, nv, ptr + OFFSET_BMIN, ptr + OFFSET_BMAX);
            CModule.free(verts_ptr);
        }

        public override function alloc():Boolean
        {
            ptr = internal_rcAlloc_rcConfig();
            return ptr != 0;
        }

        public override function free():void
        {
            internal_rcFree(ptr);
            ptr = 0;
        }
    }
}